module Types.Messages where

import Control.Applicative
import Control.Monad
import Data.Aeson
import Data.ByteString.Lazy
import Data.Text (Text)
import Database.Persist
import Helpers
import Prelude
import Types.User

data Recipient = Recipient Username (Maybe Text) deriving Show

instance UserColored Recipient where
    uName (Recipient u _) = u
    uColor (Recipient _ c) = c

instance PersistField Recipient where
    toPersistValue = PersistByteString . toStrict . encode
    fromPersistValue (PersistByteString s) = case decodeStrict s of
        Just t -> Right t
        Nothing -> Left "Couldn't decode JSON"
    fromPersistValue _ = Left "Couldn't decode non-bytestring to JSON"

instance FromJSON Recipient where
    parseJSON (Object v) = Recipient
                       <$> v .: "f1"
                       <*> v .: "f2"
    parseJSON _ = mzero

-- this instance is required for something, but never used.
instance ToJSON Recipient where
    toJSON = undefined
