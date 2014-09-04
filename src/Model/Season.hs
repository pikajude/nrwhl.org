module Model.Season where

import Data.Char
import Database.Persist
import Model
import Prelude

currentSeasonId :: SeasonId
currentSeasonId = Key (PersistInt64 1)

seasonLatin :: Season -> Char
seasonLatin m = chr $ seasonNumber m + 8543
