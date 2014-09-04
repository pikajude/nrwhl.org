module Handler.Team where

import qualified Database.Persist as P
import Import
import qualified Model as M

getTeamViewR :: Text -> Handler Html
getTeamViewR slug = do
    Entity k tm <- runDB . getBy404 $ UniqueFriendlyName slug
    (mgm, players) <- runDB $ do
        g <- maybeGet (teamGm tm)
        ps <- getCurrentPlayers k
        return (g, ps)
    canEditTeam <- enquireIf (`can` editTeam k)
    let ef = entityVal . snd
        hf (Entity _ user, _) = userLink user
        heading = mempty :: Widget
        -- totalStats = mconcat $ map (entityVal . snd) players
    defaultLayout $ do
        setTitle [shamlet|Team: #{teamName tm}|]
        $(widgetFile "team/view")

getTeamEditR :: TeamId -> Handler Html
getTeamEditR tid = do
    _ <- requireThat (`can` editTeam tid)
    t <- runDB $ get404 tid
    (widget, enctype) <- generateFormPost $ teamForm (Entity tid t)
    defaultLayout $ do
        setTitle [shamlet|Editing team: #{teamName t}|]
        $(widgetFile "team/edit")

postTeamEditR :: TeamId -> Handler Html
postTeamEditR tid = do
    _ <- requireThat (`can` editTeam tid)
    t <- runDB $ get404 tid
    ((res, widget), enctype) <- runFormPost $ teamForm (Entity tid t)
    case res of
        FormSuccess (team, mgm, magm, flog) -> do
            runDB $ do
                replace tid team
                forM_ flog $ \ fl -> P.update tid [TeamLogo P.=. fl]

                -- gm and agm can't be forged, their IDs must satisfy the
                -- query passed to optionsPersist below
                case mgm of
                    Just (Entity k _) -> assignGM (Entity tid team) k
                    Nothing -> unassignGM (Entity tid team)
                case magm of
                    Just (Entity k _) -> assignAGM (Entity tid team) k
                    Nothing -> unassignAGM (Entity tid team)
                P.updateWhere [UserCurrentTeam P.==. Just tid]
                              [UserCurrentTeamColor P.=. Just (teamColor team)]
            redirect $ TeamViewR (teamFriendlyName team)
        _ -> defaultLayout $ do
            setTitle [shamlet|Editing team: #{teamName t}|]
            $(widgetFile "team/edit")

staffFilter :: (YesodAuth master, YesodPersist master, MonadTrans t,
                PersistStore (YesodPersistBackend master (HandlerT master IO)),
                Monad (t (HandlerT master IO)),
                AuthId master ~ KeyBackend SqlBackend User,
                PersistMonadBackend
                  (YesodPersistBackend master (HandlerT master IO))
                ~ SqlBackend) =>
               KeyBackend SqlBackend Team -> t (HandlerT master IO) [Filter User]
staffFilter k = do
    ad <- lift $ enquireIf (`can` administrate)
    return [UserCurrentTeam P.==. Just k | not ad]

teamForm :: Entity Team
         -> Form (Team, Maybe (Entity User), Maybe (Entity User), Maybe Filename)
teamForm (Entity k t) extra = do
    filt <- staffFilter k
    currentGM <- case teamGm t of
        Just ku -> fmap (fmap (Entity ku)) . lift . runDB $ get ku
        Nothing -> return Nothing
    currentAGM <- case teamAgm t of
        Just ku -> fmap (fmap (Entity ku)) . lift . runDB $ get ku
        Nothing -> return Nothing
    (nameRes, nameView) <- mreq textField (formControl "Team name") (Just $ M.teamName t)
    (logoRes, logoView) <- mopt
        (imageDropField teamLogoSize) "Team logo" (Just . Just $ teamLogo t)
    (gmRes, gmView) <- mopt
        (selectField $ optionsPersist filt [] userName)
        "GM" (Just currentGM)
    (agmRes, agmView) <- mopt
        (selectField $ optionsPersist filt [] userName)
        "AGM" (Just currentAGM)
    (colorRes, colorView) <- mreq
        colorField (formControl "Team color") (Just $ teamColor t)
    (theRes, theView) <- mreq checkBoxField
        "Team has 'the' in the name" (Just $ teamThe t)
    let teamRes = (\ x c th -> t { M.teamName = x
                                 , teamFriendlyName = friendly x
                                 , teamColor = c
                                 , teamThe = th })
              <$> nameRes <*> colorRes <*> theRes
    return ((,,,) <$> teamRes
                  <*> gmRes
                  <*> agmRes
                  <*> logoRes
           , $(widgetFile "team/edit-form"))
