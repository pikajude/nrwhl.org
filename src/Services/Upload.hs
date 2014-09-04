module Services.Upload where

import Aws
import Aws.Core
import Aws.S3.Commands.PutObject
import Aws.S3.Core
import Control.Monad
import Control.Monad.IO.Class
import Control.Monad.Trans.Resource
import Data.ByteString.Lazy (toStrict)
import Data.ByteString (ByteString)
import Data.Conduit
import Data.Conduit.Binary (sinkLbs)
import qualified Data.Map as M
import Data.Maybe
import Data.Monoid
import Data.Text (Text, pack)
import qualified Data.Text.Encoding as T
import Data.Tuple (swap)
import Foundation
import Network.HTTP.Client (RequestBody (..), defaultManagerSettings, withManager)
import Network.Mime (defaultMimeMap, Extension, MimeType)
import Prelude
import Settings
import System.Random
import Text.Shakespeare.Text
import Types.S3
import Yesod

uploadBlob :: ByteString -> Text -> Handler (Either Text Filename)
uploadBlob blob contentType = do
    g <- liftIO newStdGen

    let filenamePre = pack . take 16 $ randomRs ('a', 'z') g
        filename = filenamePre <> "." <> extensionFromMime contentType

    runUpload filename contentType blob

upload :: FileInfo -> Handler (Either Text Filename)
upload src = do
    s <- fmap toStrict $ fileSource src $$ sinkLbs
    uploadBlob s (fileContentType src)

runUpload :: Text -> Text -> ByteString -> Handler (Either Text Filename)
runUpload filename contentType blob = do
    ex <- getExtra
    let requestBody = RequestBodyBS blob

    result <- liftIO . withManager defaultManagerSettings $ \ manager ->
        runResourceT $ aws
            (extraAWSConfig ex)
            (s3 HTTP s3EndpointUsClassic True)
            manager
            (putObject (extraAWSBucket ex) filename requestBody)
                { poAcl = Just AclPublicRead
                , poContentType = Just $ T.encodeUtf8 contentType }

    case responseResult result of
        Left e -> return $ Left [st|#{show e}|]
        Right _ -> return . Right $ Filename filename

extensionFromMime :: Text -> Text
extensionFromMime t = M.findWithDefault "mystery" (T.encodeUtf8 t) reverseMimeMap

reverseMimeMap :: M.Map MimeType Extension
reverseMimeMap = M.fromList . map swap $ M.toList defaultMimeMap
