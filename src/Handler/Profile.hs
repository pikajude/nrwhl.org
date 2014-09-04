{-# LANGUAGE ViewPatterns #-}

module Handler.Profile where

import Data.Function (on)
import Data.List (groupBy)
import qualified Database.Persist as P
import Import hiding (on, groupBy)
import Prelude (head)

getUserViewR :: Username -> Handler Html
getUserViewR unf = do
    Entity userId user <- runDB $ getBy404UniqueUsername unf
    allStats <-
          map (\ xs@(head -> (x, _)) -> (x, mconcat $ map (entityVal . snd) xs))
          . groupBy ((==) `on` (seasonNumber . entityVal . fst))
        <$> runDB (getAllStats userId)
    mteam <- runDB $ getCurrentTeam user

    releasable <- enquireIf (`can` release user)
    editable <- enquireIf (`can` editUser user)
    adm <- enquireIf (`can` administrate)
    imp <- isImpersonated

    let hf :: (Entity Season, PlayerStats) -> Widget
        hf (Entity _ p, _) = [whamlet|#{seasonLatin p}|]
        heading :: Widget
        heading = [whamlet|Season|]
    defaultLayout $ do
        setTitle [shamlet|User: #{userName user}|]
        $(widgetFile "profile")

getUserEditR :: Username -> Handler Html
getUserEditR name = do
    Entity _userId user <- runDB $ getBy404UniqueUsername name
    _ <- requireThat (`can` editUser user)
    (widget, enctype) <- generateFormPost (userForm user)
    defaultLayout $(widgetFile "user/edit")

postUserEditR :: Username -> Handler Html
postUserEditR name = do
    Entity uid user <- runDB $ getBy404UniqueUsername name
    _ <- requireThat (`can` editUser user)
    ((res, widget), enctype) <- runFormPost (userForm user)
    case res of
        FormSuccess (u, a, t) -> do
            runDB $ do
                replace uid u
                case t of
                    Just (Entity k _) -> recruitPlayer uid k
                    _ -> releasePlayer uid
                forM_ a $ \ av -> P.update uid [UserAvatar P.=. Just av]
            redirect $ UserViewR name
        _ -> defaultLayout $(widgetFile "user/edit")

userForm :: User -> Form (User, Maybe Filename, Maybe (Entity Team))
userForm u extra = do
    adm <- lift $ enquireIf (`can` administrate)
    t <- lift . runDB $ getCurrentTeam u
    let mt = liftM2 Entity (userCurrentTeam u) t
    (emailRes, emailView) <- mreq validEmailField
        (formControl "Email") (Just (userEmail u))
    (avatarRes, avatarView) <- mopt (imageDropField userAvatarSize)
        (formControl "Avatar") (Just (userAvatar u))
    (curTeamRes', curTeamView) <- mopt (selectField $ optionsPersist [] [] teamName)
        (formControl "Current team") (Just mt)
    let userRes = (\ e -> u { userEmail = e })
              <$> emailRes
        curTeamRes = if adm then curTeamRes' else pure mt
    return ( liftA3 (,,) userRes avatarRes curTeamRes
           , do
               toWidget [coffee|$(document).on "ready", -> $("select").selectize()|]
               $(widgetFile "user/edit-form"))
