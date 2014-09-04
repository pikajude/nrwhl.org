module Model.PlayerStats where

import Data.Fixed
import Data.Text (Text, pack)
import Model
import Prelude
import Text.Printf

playerStatsPoints :: PlayerStats -> Int
playerStatsPoints PlayerStats
    { playerStatsGoals = g
    , playerStatsAssists = a
    } = g + a

playerStatsPPG :: PlayerStats -> Double
playerStatsPPG ps = guardNaN $ fromIntegral (playerStatsPoints ps)
                             / fromIntegral (playerStatsSecondsPlayed ps) * 600

playerStatsSecondsPlayed :: PlayerStats -> Int
playerStatsSecondsPlayed PlayerStats
    { playerStatsSecondsPlayedGk = g
    , playerStatsSecondsPlayedOffense = o
    } = g + o

playerStatsGAA :: PlayerStats -> Double
playerStatsGAA PlayerStats
    { playerStatsSecondsPlayedGk = g
    , playerStatsGoalsAllowed = ga
    } = guardNaN $ fromIntegral ga / fromIntegral g * 600

playerStatsTimePlayedOffense :: PlayerStats -> Text
playerStatsTimePlayedOffense PlayerStats
    { playerStatsSecondsPlayedOffense = o
    } = pack $ uncurry (printf "%d:%02d") (o `divMod` 60)

playerStatsTimePlayedGk :: PlayerStats -> Text
playerStatsTimePlayedGk PlayerStats
    { playerStatsSecondsPlayedGk = o
    } = pack $ uncurry (printf "%d:%02d") (o `divMod` 60)

playerStatsGamesPlayedOffense :: PlayerStats -> Deci
playerStatsGamesPlayedOffense p =
    fromIntegral (playerStatsSecondsPlayedOffense p `div` 300) / 2

playerStatsGamesPlayedGk :: PlayerStats -> Deci
playerStatsGamesPlayedGk p = fromIntegral (playerStatsSecondsPlayedGk p `div` 300) / 2

guardNaN :: RealFloat a => a -> a
guardNaN m = if isNaN m then 0 else m
