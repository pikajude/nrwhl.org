{-# OPTIONS_GHC -fno-warn-orphans #-}

module Types.MessageHash (
    MessageHash (MessageHash, timestamp, sender, receiver)
  , snippet
) where

import qualified Data.ByteString.Lazy.Char8 as B
import Data.Digest.Pure.SHA
import Data.Monoid
import Data.Thyme
import Data.Text (pack)
import qualified Data.Text as T
import Database.Persist.Sql
import Prelude
import Yesod.Core.Dispatch

data MessageHash = MessageHash
                 { timestamp :: UTCTime
                 , sender :: PersistValue
                 , receiver :: PersistValue }
                 | MessageHashed T.Text
                 deriving (Show, Eq, Read)

snippet :: MessageHash -> T.Text
snippet (MessageHashed t) = T.take 6 t
snippet _ = undefined

instance PersistField MessageHash where
    toPersistValue (MessageHash t s r) =
        PersistText . pack . showDigest . sha1 $
            B.pack $ show t <> show s <> show r
    toPersistValue (MessageHashed t) = PersistText t
    fromPersistValue (PersistText t) = Right (MessageHashed t)
    fromPersistValue _ = Left "Invalid type for MessageHash"

instance PersistFieldSql MessageHash where
    sqlType _ = SqlString

instance PathPiece MessageHash where
    fromPathPiece t = Just $ MessageHashed t
    toPathPiece (MessageHashed t) = t
    toPathPiece _ = error "Tried to make a path-piece out of a non-hashed message!"
