{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE ViewPatterns #-}

module Handler.Error where

import Airbrake
import Control.Applicative
import Control.Monad.Catch (MonadCatch, catchAll)
import Data.ByteString.UTF8 (toString)
import Data.Text (Text, pack)
import Paths_narwhal
import Prelude
import Settings
import Settings.Development
import Settings.StaticFiles
import System.Directory
import qualified Text.Shakespeare.Text as S (st)
import Yesod
import Yesod.Static

text :: Text -> Text
text = id

air :: (MonadCatch m, MonadHandler m, MonadLogger m, MonadBaseControl IO m)
    => Extra -> Text -> Text -> m ()
air ex title desc = (`catchAll` hndl) $ do
    req <- reqWaiRequest <$> getRequest
    root <- liftIO getCurrentDirectory
    let conf = AirbrakeConf
                   (extraAirbrakeHost ex ++ "/notifier_api/v2/notices")
                   (extraAirbrakeKey ex)
                   (Server
                       (if development then "development" else "production")
                       (Just version)
                       (Just root))
    $notifyReqQ conf req (Error title desc)
    where hndl e = $logError (pack $ show e)

handler :: Yesod site
        => Extra
        -> (StaticRoute -> Route site)
        -> ErrorResponse
        -> HandlerT site IO TypedContent
handler key st NotFound = do
    air key "Not Found" "Not Found"
    selectRep $ do
        provideRep . defaultLayout $ do
            setTitle "Not Found"
            let title = text "Not Found"
                subtext = [shamlet|Try going <a href=/>back home</a>.|]
            $(widgetFile "error")
        provideRep . return $ object ["message" .= text "Not Found"]

handler key st (InternalError t) = do
    air key "Internal Server Error" t
    selectRep $ do
        provideRep . defaultLayout $ do
            setTitle "Internal Server Error"
            let title = text "Internal Server Error"
                subtext = if development
                    then [shamlet|<code>#{t}|]
                    else [shamlet|The admins have been notified!|]
            $(widgetFile "error")
        provideRep . return $ object [ "message" .= text "Internal server error"
                                     , "error" .= t
                                     ]

handler key st (BadMethod (toString -> m)) = do
#ifdef HLINT
    nothing
#else
    air key "Bad Method" [S.st|#{m}|]
#endif
    selectRep $ do
        provideRep . defaultLayout $ do
            setTitle "Bad Method"
            let title = text "Bad Method"
                subtext = [shamlet|
                    This page doesn't accept the <code>#{m}</code> method!
                    |]
            $(widgetFile "error")
        provideRep . return $ object [ "message" .= text "Bad method"
                                     , "method" .= m ]

handler key st (PermissionDenied t) = do
    air key "Permission Denied" t
    selectRep $ do
        provideRep . defaultLayout $ do
            setTitle "Permission Denied"
            let title = text "Permission Denied"
                subtext = [shamlet|
                    #{t}
                    |]
            $(widgetFile "error")
#ifdef HLINT
        nothing
#else
        provideRep . return $ object [ "message" .= [S.st|Permission denied: #{t}|] ]
#endif

handler key st (InvalidArgs a) = do
    air key "Invalid Args" (pack (show a))
    selectRep $ do
        provideRep . defaultLayout $ do
            setTitle "Invalid Arguments"
            let title = text "Invalid Arguments"
                subtext = [shamlet|Arguments given: #{show a}|]
            $(widgetFile "error")
#ifdef HLINT
        nothing
#else
        provideRep . return $ object [ "message" .= [S.st|Invalid arguments: #{show a}|] ]
#endif

handler key st NotAuthenticated = do
    air key "Not Authenticated" "Not Authenticated"
    selectRep $ do
        provideRep . defaultLayout $ do
            setTitle "Not Authenticated"
            let title = text "Not Authenticated"
                subtext = [shamlet|Try going <a href=/>back home</a>.|]
            $(widgetFile "error")
        provideRep . return $ object [ "message" .= text "Not authenticated" ]
