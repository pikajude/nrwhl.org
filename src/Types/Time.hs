module Types.Time where

import Data.Thyme
import Prelude

pacificTime :: TimeZone
pacificTime = TimeZone (negate 480) False "PST"
