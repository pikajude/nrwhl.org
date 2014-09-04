module Handler.Mail (sendMail) where

import Aws
import Aws.Ses.Commands.SendRawEmail
import Aws.Ses.Core
import Control.Exception (fromException, throw)
import Control.Monad.Trans.Resource
import qualified Data.ByteString.Lazy as B
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy.Builder as LT
import qualified Data.Text.Lazy.Encoding as LT
import Import
import Network.HTTP.Conduit
import Network.Mail.Mime
import Text.Blaze.Html.Renderer.Utf8
import qualified Text.Email.Parser as E
import Yesod.Core.Types

sendMail :: E.EmailAddress
         -> Text
         -> (RY App -> LT.Builder, RY App -> Html)
         -> Handler (Either SesError ())
sendMail dest subj (plain, html) = do
    m <- getUrlRenderParams
    ext <- getExtra
    let (tV, hV) = (plain m, html m)
        textVersion = Part
                    { partType = "text/plain; charset=utf-8"
                    , partHeaders = []
                    , partEncoding = None
                    , partFilename = Nothing
                    , partContent = LT.encodeUtf8 $ LT.toLazyText tV
                    }
        htmlVersion = Part
                    { partType = "text/html; charset=utf-8"
                    , partHeaders = []
                    , partEncoding = None
                    , partFilename = Nothing
                    , partContent = renderHtml hV
                    }
    res <- withManager $ \ man -> do
        $logInfo [st|Sending message to #{dest}|]
        let msg = Mail {
                  mailFrom = Address (Just "NArwHaL Staff") "admin@nrwhl.org"
                , mailTo = [Address Nothing (T.decodeUtf8 $ E.toByteString dest)]
                , mailCc = []
                , mailBcc = []
                , mailHeaders = [("Subject", subj)]
                , mailParts = [[textVersion, htmlVersion]]
                }
        rendered <- liftIO $ renderMail' msg
        liftResourceT $ aws
            (extraAWSConfig ext)
            (sesHttpsPost sesUsWest)
            man
            (SendRawEmail
                [T.decodeUtf8 $ E.toByteString dest]
                (RawMessage $ B.toStrict rendered)
                (Just (Sender "admin@nrwhl.org")))
    case responseResult res of
        Left e -> case fromException e of
            Just se@SesError {} -> do
                ex <- getExtra
                air ex [st|#{show se}|]
                    [st|Failed sending email to #{T.decodeUtf8 $ E.toByteString dest}|]
                return $ Left se
            Nothing -> throw e
        Right _ -> do
            $logInfo [st|Sent message to #{dest} using SES.|]
            $logInfo [st|Response from AWS: #{show res}|]
            return $ Right ()
    where
        sesUsWest = "email.us-west-2.amazonaws.com"
