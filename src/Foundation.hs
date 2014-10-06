{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE ViewPatterns #-}

module Foundation where

import Control.Applicative
import Control.Concurrent.STM.Lifted
import Control.Monad.Logger
#ifdef DEVELOPMENT
import Control.Monad.Trans.Resource
#endif
import Crypto.PasswordStore
import qualified Database.Persist
import Database.Persist.Sql (SqlBackend
#ifdef DEVELOPMENT
                            , runSqlPool, SqlPersistT
#endif
                            )
import Data.ByteString (ByteString)
import Data.Maybe
import Data.Monoid
import qualified Data.Text.Encoding as T
import Handler.Error
import Model hiding (teamName)
import Model.Auth
import Model.Team
import Data.Text (Text)
import Network.HTTP.Conduit (Manager)
import Prelude
import Settings (widgetFile, Extra (..))
import qualified Settings
import Settings.Development (development)
import Settings.StaticFiles
import Text.Hamlet (hamletFile)
import Text.Jasmine (minifym)
import Text.Shakespeare.Text (st)
import Types.MessageHash
import Types.S3
import Types.User
import Yesod
import Yesod.Auth
import Yesod.Core.Types (Logger)
import Yesod.Default.Config
import Yesod.Default.Util (addStaticContentExternal)
import Yesod.Static

data App = App
    { settings :: AppConfig DefaultEnv Extra
    , getStatic :: Static
    , connPool :: Database.Persist.PersistConfigPool Settings.PersistConf
    , httpManager :: Manager
    , persistConfig :: Settings.PersistConf
    , appLogger :: Logger
    , messages :: TChan Text
    }

mkMessage "App" "messages" "en"

mkYesodData "App" $(parseRoutesFile "config/routes")

type Form x = Html -> MForm (HandlerT App IO) (FormResult x, Widget)

instance Yesod App where
    approot = ApprootMaster $ appRoot . settings

    makeSessionBackend _ = Just <$> defaultClientSessionBackend
        (120 * 60)
        "config/client_session_key.aes"

    defaultLayout widget = do
        mmsg <- getMessage
        imp <- isImpersonated
        wreq <- reqWaiRequest <$> getRequest
        isAdmin <- enquireIf (`can` administrate)
        mau <- fmap entityVal <$> maybeAuth
        currentTeam <- maybe (return Nothing) (runDB . maybeGet . userCurrentTeam) mau
        currentRoute <- getCurrentRoute
        crumbs <- breadcrumbs

        let isProfilePage = currentRoute == fmap (UserViewR . userName) mau
            isSearchPage = currentRoute == Just PlayerFindR
                        || currentRoute == Just TeamFindR
            isMessagesPage = case currentRoute of
                                 Just MessageInboxR -> True
                                 Just MessageOutboxR -> True
                                 Just MessageNewR -> True
                                 Just MessageRecipientSearchR -> True
                                 Just (MessageSentR _) -> True
                                 Just (MessageRecipientsViewR _) -> True
                                 Just (MessageReadR _) -> True
                                 _ -> False
            isAdminPage = currentRoute `elem` map Just
                              [AdminR, ManageTeamsR, ManageTeamsNewR]
            isHome = currentRoute == Just HomeR
            isLogin = case currentRoute of
                          Just (AuthR _) -> True
                          _ -> False
            isRegister = currentRoute == Just AuthRegisterR

        pc <- widgetToPageContent $ do
            $(combineScripts 'StaticR
                [ jquery_js
                , js_bootstrap_js
                , holder_js
                , javascripts_jquery_tipsy_js
                , js_standalone_selectize_js
                ])
            $(combineStylesheets 'StaticR
                [ css_bootstrap_css
                , stylesheets_tipsy_css
                , css_selectize_bootstrap3_css
                ])
            $(widgetFile "uploads")
            $(widgetFile "default-layout")

        withUrlRenderer $(hamletFile "templates/default-layout-wrapper.hamlet")

    urlRenderOverride y (StaticR s) =
        Just $ uncurry (joinPath y (Settings.staticRoot $ settings y)) $ renderRoute s
    urlRenderOverride y@(extraUploadDomain . appExtra . settings -> d) s@(S3AssetR _) =
        let (a, b) = renderRoute s
         in Just $ joinPath y ("https://" <> d) (tail a) b
    urlRenderOverride _ _ = Nothing

    authRoute _ = Just $ AuthR LoginR

    addStaticContent =
        addStaticContentExternal minifym genFileName
            Settings.staticDir (StaticR . flip StaticRoute [])
      where
        genFileName lbs
            | development = "autogen-" ++ base64md5 lbs
            | otherwise = base64md5 lbs

    jsLoader _ = BottomOfBody

    shouldLog _ _source level =
        development || level == LevelWarn || level == LevelError

    makeLogger = return . appLogger

    errorHandler resp = do
        ex <- getExtra
        handler ex StaticR resp

instance YesodPersist App where
    type YesodPersistBackend App = SqlBackend
    runDB = defaultRunDB persistConfig connPool
instance YesodPersistRunner App where
    getDBRunner = defaultGetDBRunner connPool

instance YesodAuth App where
    type AuthId App = UserId

    loginDest _ = HomeR
    logoutDest _ = HomeR

    getAuthId creds = do
        muid <- maybeAuthId
        case muid of
            Just uid -> return $ Just uid
            Nothing -> do
                x <- runDB . getByUniqueUsername . fromText $ credsIdent creds
                case x of
                    Just (Entity uid _) -> return $ Just uid
                    Nothing -> do
                        _ <- loginErrorMessage (AuthR LoginR) "User not found"
                        fail "getAuthId: should redirect"

    authPlugins _ = [AuthPlugin "hash" disp (\ tm -> $(widgetFile "login-form"))] where
        disp :: Text -> [Text] -> HandlerT Auth (HandlerT App IO) TypedContent
        disp "POST" ["login"] = postLoginR >>= sendResponse
        disp "GET" ["logout"] = do
            deleteSession impersonationKey
            lift $ toTypedContent <$> clearCreds True
        disp _ _ = notFound
        login = PluginR "hash" ["login"]
        postLoginR = do
            (mu, mp) <- lift . runInputPost $ (,)
                <$> iopt textField "username"
                <*> iopt textField "password"

            isValid <- lift $ fromMaybe (return False)
                        (validateUser <$> fmap fromText mu <*> fmap T.encodeUtf8 mp)
            lift $ if isValid
                then fmap toTypedContent . setCreds True $
                         Creds "hash" (fromMaybe "" mu) []
                else loginErrorMessage (AuthR LoginR) "Username or password incorrect!"

            where
                validateUser :: Username -> ByteString -> Handler Bool
                validateUser userID passwd = do
                    user <- runDB $ getByUniqueUsername userID
                    case user of
                        Nothing -> return False
                        Just (Entity _ m) -> return $
                            verifyPassword passwd (userPassword m)

    authHttpManager = httpManager

instance YesodAuthPersist App

instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

instance RenderMessage App Username where
    renderMessage a b msg = renderMessage a b (toText msg)

instance YesodBreadcrumbs App where
    breadcrumb r = case r of
        AboutR -> simple "About"
        AdminImpersonateStartR i -> return ([st|Impersonate ##{toPathPiece i}|], Just AdminR)
        AdminImpersonateStopR -> return ("Stop impersonating", Just AdminR)
        AdminR -> simple "Admin"
        AuthR _ -> simple "Log in"
        AuthRegisterR -> simple "Register"
        AuthVerifyR _ _ -> return ("Verify your identity", Just AuthRegisterR)
        DraftR -> simple "Draft"
        FaviconR -> simple "favicon"
        HomeR -> simple "Home"
        ManageTeamsNewR -> return ("New team", Just ManageTeamsR)
        ManageTeamsR -> return ("Manage teams", Just AdminR)
        MessageInboxPageR i -> page i MessageInboxR
        MessageInboxR -> simple "Messages"
        MessageNewR -> return ("New", Just MessageInboxR)
        MessageOutboxPageR i -> page i MessageOutboxR
        MessageOutboxR -> return ("Outbox", Just MessageInboxR)
        MessageReadR h -> return ([st|##{snippet h}|], Just MessageInboxR)
        MessageRecipientSearchR -> return ("Recipient search", Just MessageNewR)
        MessageRecipientsViewR i -> return ("Recipients", Just (MessageSentR i))
        MessageReplyR h -> return ("Reply", Just (MessageReadR h))
        MessageSentR i -> return ([st|##{toPathPiece i}|], Just MessageOutboxR)
        PlayerFindPageR i -> page i PlayerFindR
        PlayerFindR -> simple "Player search"
        PlayerReleaseR u -> return ("Release", Just (UserViewR u))
        ReportR -> simple "Match report"
        RobotsR -> simple "robots.txt"
        S3AssetR _ -> simple "S3 assets"
        StaticR _ -> simple "Static"
        TeamEditR tid -> teamPage "Edit" tid
        TeamFindR -> simple "Team search"
        TeamRosterAGMR tid -> teamPage "AGM" tid
        TeamRosterGMR tid -> teamPage "GM" tid
        TeamRosterR tid -> teamPage "Roster" tid
        TeamViewR t ->
            simple . maybe "Unknown team" (teamName . entityVal)
                =<< runDB (getBy $ UniqueFriendlyName t)
        UserEditR u -> return ("Edit", Just (UserViewR u))
        UserViewR u -> return ([st|#{unwrap u}'s profile|], Nothing)
        where
            simple x = return (x, Nothing)
            page x p = return ([st|Page #{x}|], Just p)
            teamPage title tid = do
                team <- runDB (get tid)
                return (title, fmap (TeamViewR . teamFriendlyName) team)

getExtra :: Handler Extra
getExtra = fmap (appExtra . settings) getYesod

isImpersonated :: Handler Bool
isImpersonated = isJust <$> lookupSession impersonationKey

impersonationKey :: Text
impersonationKey = "_CROUCH"

#if DEVELOPMENT
db :: SqlPersistT (LoggingT (ResourceT IO)) a -> IO a
db m = do
    dbconf <- withYamlEnvironment "config/postgresql.yml" Development
                  Database.Persist.loadConfig >>= Database.Persist.applyEnv
    pool <- Database.Persist.createPoolConfig (dbconf :: Settings.PersistConf)
    runResourceT $ runStdoutLoggingT $ runSqlPool m pool
#endif
