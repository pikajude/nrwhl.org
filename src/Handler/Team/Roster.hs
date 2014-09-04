module Handler.Team.Roster where

import Control.Monad.RWS (RWST)
import Import

getTeamRosterR :: TeamId -> Handler Html
getTeamRosterR tid = do
    _ <- requireThat (`can` editTeam tid)
    (team, players) <- runDB $ do
        t <- get404 tid
        ps <- getCurrentPlayers tid
        return (t, ps)
    ((extra, xml), enctype) <- generateFormPost (promotionForm tid)
    defaultLayout $ do
        setTitle [shamlet|Editing roster: #{teamName team}|]
        $(widgetFile "team/roster")

postTeamRosterGMR :: TeamId -> Handler Html
postTeamRosterGMR tid = do
    _ <- requireThat (`can` editTeam tid)
    ((res, _), _) <- runFormPost (promotionForm tid)
    t <- runDB $ get404 tid
    forM_ res $ \ k -> runDB $ assignGM (Entity tid t) k
    redirect $ TeamRosterR tid

postTeamRosterAGMR :: TeamId -> Handler Html
postTeamRosterAGMR = undefined

promotionForm :: (YesodPersist site, RenderMessage site FormMessage,
                  PersistStore (YesodPersistBackend site (HandlerT site IO)),
                  PersistMonadBackend (YesodPersistBackend site (HandlerT site IO))
                  ~ SqlBackend) =>
                 KeyBackend SqlBackend Team
                 -> t
                 -> RWST
                      (Maybe (Env, FileEnv), site, [Lang])
                      Enctype
                      Ints
                      (HandlerT site IO)
                      (FormResult (KeyBackend SqlBackend User), (t, FieldView site))
promotionForm tid extra = do
    (userRes, userView) <- mreq userIdField sting Nothing
    return (userRes, (extra, userView))
    where
        sting = "Player" { fsId = Just "victim"
                         , fsName = Just "victim" }
        userIdField = Field fp fv fe where
            fp [ts] _ = case fromPathPiece ts of
                Nothing -> return (Left . SomeMessage $ text "Invalid ID.")
                Just x -> runDB $ do
                    player <- get x
                    return $ case player of
                        Just pl -> if userCurrentTeam pl == Just tid
                                       then Right (Just x)
                                       else Left (SomeMessage $ text "Wrong team.")
                        Nothing -> Left (SomeMessage $ text "Unknown player.")
            fp [] _ = return $ Right Nothing
            fp _ _ = return . Left . SomeMessage $ text "Multiple values provided."
            fv _ _ _ _ _ = [whamlet|<font color=red>shouldn't be used!|]
            fe = UrlEncoded
