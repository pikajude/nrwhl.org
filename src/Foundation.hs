{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE RankNTypes #-}
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
                            , runSqlPool
#endif
                            )
import Data.ByteString (ByteString)
import Data.Maybe
import Data.Monoid
import qualified Data.Text.Encoding as T
import Handler.Error
import Model
import Model.Auth
import Data.Text (Text)
import Network.HTTP.Conduit (Manager)
import Prelude
import Settings (widgetFile, Extra (..))
import qualified Settings
import Settings.Development (development)
import Settings.StaticFiles
import Text.Hamlet (hamletFile)
import Text.Jasmine (minifym)
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

instance RenderMessage App FormMessage where
    renderMessage _ _ = defaultFormMessage

instance RenderMessage App Username where
    renderMessage a b msg = renderMessage a b (toText msg)

getExtra :: Handler Extra
getExtra = fmap (appExtra . settings) getYesod

isImpersonated :: Handler Bool
isImpersonated = isJust <$> lookupSession impersonationKey

impersonationKey :: Text
impersonationKey = "_CROUCH"

#if DEVELOPMENT
-- db :: SqlPersistT (LoggingT (ResourceT IO)) b -> IO b
db m = do
    dbconf <- withYamlEnvironment "config/postgresql.yml" Development
                  Database.Persist.loadConfig >>= Database.Persist.applyEnv
    pool <- Database.Persist.createPoolConfig (dbconf :: Settings.PersistConf)
    runResourceT $ runStdoutLoggingT $ runSqlPool m pool
#endif
