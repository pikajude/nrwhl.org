{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans -fno-warn-auto-orphans -Werror #-}

module Model.Instances where

import Control.Applicative
import Control.Monad
import Control.Monad.Random
import Data.Aeson
import Data.ByteString (ByteString)
import qualified Data.ByteString.Char8 as B
import Data.Char
import Data.Foldable
import Data.Monoid ((<>), mempty)
import Data.String
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Text.Lazy as T (toStrict, fromStrict)
import qualified Data.Text.Lazy.Builder as LT
import qualified Data.Text.Normal.NFKC as N
import Data.Thyme
import Data.Thyme.Time.Core
import Database.Esqueleto
import Database.Esqueleto.Internal.Sql
import Model.Instances.Debug ()
import Prelude
import Text.Blaze
import Text.Email.Parser
import qualified Text.Email.Validate as E
import Text.Markdown
import Text.Shakespeare.Text (ToText (..), st)
import Web.PathPieces
import Yesod.Form

instance Foldable FormResult where
    foldMap f (FormSuccess a) = f a
    foldMap _ _ = mempty

instance PersistField UTCTime where
    toPersistValue = PersistUTCTime . fromThyme
    fromPersistValue (PersistUTCTime t) = Right $ toThyme t
    fromPersistValue _ = Left "Incorrect type for UTCTime"

instance PersistFieldSql UTCTime where
    sqlType = sqlType . liftM fromThyme

instance FromJSON UTCTime where
    parseJSON = fmap toThyme . parseJSON

instance ToJSON UTCTime where
    toJSON = toJSON . fromThyme

instance FromJSON ByteString where
    parseJSON (String s) = return $ T.encodeUtf8 s
    parseJSON _ = mzero

instance ToJSON ByteString where
    toJSON b = String $ T.decodeUtf8 b

instance PersistField Markdown where
    toPersistValue (Markdown t) = PersistText $ T.toStrict t
    fromPersistValue (PersistText t) = Right $ Markdown $ T.fromStrict t
    fromPersistValue _ = Left "Type error for Markdown"

instance PersistFieldSql Markdown where
    sqlType _ = SqlString

fromCamel :: String -> String
fromCamel [] = []
fromCamel (x : xs) = toLower x : go xs where
    go (y : ys) | isUpper y = '_' : toLower y : go ys
                | otherwise = y : go ys
    go [] = []

validChar :: Char -> Bool
validChar = (/= NotAssigned) . generalCategory

instance PersistField N.Normal where
    fromPersistValue = fmap N.fromText . fromPersistValue
    toPersistValue = toPersistValue . N.toText

instance PersistFieldSql N.Normal where
    sqlType = sqlType . liftM N.toText

instance FromJSON N.Normal where
    parseJSON = fmap N.fromText . parseJSON

instance ToJSON N.Normal where
    toJSON = toJSON . N.toText

instance PathPiece N.Normal where
    toPathPiece = toPathPiece . N.toText
    fromPathPiece = fmap N.fromText . fromPathPiece

instance Random T.Text where
    randomR _ = random
    random = runRand $ fmap (T.strip . T.pack) $ take
                 <$> getRandomR (5, 24)
                 <*> fmap (filter validChar) (getRandomRs (' ', '~'))

instance Random N.Normal where
    randomR _ = random
    random g = let (a', g') = random g in (N.fromText a', g')

instance ToMarkup N.Normal where
    toMarkup = toMarkup . N.toText

instance ToText N.Normal where
    toText = toText . N.toText

instance PersistField EmailAddress where
    toPersistValue = toPersistValue . toByteString
    fromPersistValue (PersistByteString b) = case E.validate b of
        Left s -> Left [st|Invalid email address #{show b}: #{s}|]
        Right e -> Right e
    fromPersistValue _ = Left "Wrong type for EmailAddress"

instance PersistFieldSql EmailAddress where
    sqlType _ = SqlBlob

instance FromJSON EmailAddress where
    parseJSON (String s) = either (const mzero) return $ E.validate $ T.encodeUtf8 s
    parseJSON _ = mzero

instance ToJSON EmailAddress where
    toJSON e = String $ T.decodeUtf8 $ toByteString e

instance ToText EmailAddress where
    toText = LT.fromText . T.decodeUtf8 . E.toByteString

instance Random EmailAddress where
    randomR _ = random
    random = runRand $ do
        localLen <- getRandomR (4, 15)
        remoteLen <- getRandomR (4, 15)
        local <- B.pack <$> replicateM localLen randomChar
        remote <- B.pack <$> replicateM remoteLen randomChar
        case E.validate (local <> "@" <> remote <> ".org") of
            Right e -> return e
            _ -> fail "failed to validate randomly generated email address"
        where
            emailChars = ['A' .. 'Z'] ++ ['a' .. 'z'] ++ ['0' .. '9']
                      ++ "!#$%&'*+/=?^_`{|}~-"
            randomChar = (emailChars !!) <$> getRandomR (0, 80)

-- helpers

subArray_select :: (PersistField a, Esqueleto query SqlExpr SqlBackend)
                => query (SqlExpr (Database.Esqueleto.Value a))
                -> SqlExpr (Database.Esqueleto.Value [a])
subArray_select = unsafeSqlFunction "array"
                . veryUnsafeCoerceSqlExprValueList . subList_select

sqlAsJson :: UnsafeSqlFunctionArgument a => b -> a -> SqlExpr (Database.Esqueleto.Value b)
sqlAsJson _proxy = unsafeSqlFunction "row_to_json" . unsafeSqlFunction "row"

{-# ANN module ("HLint: ignore Use camelCase" :: String) #-}
