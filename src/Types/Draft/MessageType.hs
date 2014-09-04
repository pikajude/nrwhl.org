module Types.Draft.MessageType where

import Control.Applicative
import Control.Arrow
import Control.Monad
import Data.Aeson
import Data.ByteString.Lazy (toStrict)
import Data.Text (Text, pack)
import Database.Persist.Sql as P
import Prelude

data MessageType = Message Text
                 | Action Text
                 | Offer Text Text
                 deriving Show

asText :: Text -> Text
asText = id

instance ToJSON MessageType where
    toJSON (Message text) = object ["type" .= asText "message", "content" .= text]
    toJSON (Action text) = object ["type" .= asText "action", "content" .= text]
    toJSON (Offer from to) = object ["type" .= asText "offer", "from" .= from, "to" .= to]

instance FromJSON MessageType where
    parseJSON (Object v) = do
        ty <- v .: "type"
        case ty :: Text of
            "message" -> Message <$> v .: "content"
            "action" -> Action <$> v .: "content"
            "offer" -> Offer <$> v .: "from" <*> v .: "to"
            _ -> mzero
    parseJSON _ = mzero

instance PersistField MessageType where
    toPersistValue = toPersistValue . toStrict . encode
    fromPersistValue (PersistByteString t) = left pack $ eitherDecodeStrict' t
    fromPersistValue _ = Left "can't be converted from json"

instance PersistFieldSql MessageType where
    sqlType _ = SqlBlob
