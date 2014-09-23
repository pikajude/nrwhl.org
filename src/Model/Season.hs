module Model.Season where

import Data.Char
import Model
import Prelude

currentSeasonId :: SeasonId
currentSeasonId = SeasonKey 1

seasonLatin :: Season -> Char
seasonLatin m = chr $ seasonNumber m + 8543
