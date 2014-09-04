module Types.Position where

import Data.Aeson.TH
import qualified Data.Text as T
import Database.Persist.TH
import Prelude
import Text.Blaze

data Position = Forward
              | Midfielder
              | Goalkeeper
              deriving (Read, Show, Eq)

instance ToMarkup Position where
    toMarkup = toMarkup . T.pack . show
    preEscapedToMarkup = preEscapedToMarkup . T.pack . show

derivePersistField "Position"
deriveJSON defaultOptions ''Position
