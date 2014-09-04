module Types.S3 where

import Control.Monad
import Data.Aeson
import Data.Map (Map)
import Data.Text (Text)
import Database.Persist
import Database.Persist.Sql
import Prelude
import Web.PathPieces

newtype Filename = Filename { unFilename :: Text }
                 deriving (Read, Show, Eq)

data ImageUpload = ImageUpload
                 { sized :: Map (Int, Int) Filename
                 } deriving (Read, Show, Eq)

instance PersistField Filename where
    toPersistValue = toPersistValue . unFilename
    fromPersistValue = fmap Filename . fromPersistValue

instance PersistFieldSql Filename where
    sqlType = sqlType . liftM unFilename

instance FromJSON Filename where
    parseJSON = fmap Filename . parseJSON

instance ToJSON Filename where
    toJSON = toJSON . unFilename

instance PathPiece Filename where
    toPathPiece = toPathPiece . unFilename
    fromPathPiece = fmap Filename . fromPathPiece
