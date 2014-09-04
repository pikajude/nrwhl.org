module Types.User (Username, unwrap, fromText, toText) where

import Control.Arrow
import Control.Monad
import Data.Aeson
import Data.Char
import Data.Monoid
import Data.String
import Data.Text (Text)
import qualified Data.Text as T
import Data.Text.Normal.NFKC hiding (fromText, toText)
import qualified Data.Text.Normal.NFKC as N
import Database.Persist
import Database.Persist.Sql
import Model.Instances ()
import Prelude
import Text.Blaze
import qualified Text.Shakespeare.Text as S
import Web.PathPieces

newtype Username = Username { unwrap :: Normal } deriving (Show, Eq)

instance PersistField Username where
    toPersistValue = toPersistValue . unwrap
    fromPersistValue = fmap Username . fromPersistValue

instance PersistFieldSql Username where
    sqlType = sqlType . liftM unwrap

instance ToJSON Username where
    toJSON = toJSON . unwrap

instance FromJSON Username where
    parseJSON = fmap fromText . parseJSON

instance Read Username where
    readsPrec i = fmap (first fromText) . readsPrec i

instance PathPiece Username where
    fromPathPiece = fmap fromText . fromPathPiece
    toPathPiece = toPathPiece . unwrap

instance ToMarkup Username where
    toMarkup = toMarkup . unwrap

instance Monoid Username where
    mempty = Username mempty
    mappend a b = Username $ mappend (unwrap a) (unwrap b)

instance IsString Username where
    fromString = fromText . fromString

instance S.ToText Username where
    toText = S.toText . unwrap

fromText :: Text -> Username
fromText = Username . N.fromText . squeeze . T.filter elideSpaces where
    elideSpaces n = generalCategory n `notElem` [Space, Control, Format]
                 || n `elem` " -"
    -- turn consecutive spaces into one space
    squeeze = T.unwords . T.words

toText :: Username -> Text
toText = N.toText . unwrap
