module Model.User (
    -- * actual model stuff
    getCurrentTeam, getAllStats,

    userAvatarSize
) where

import Control.Monad
import Control.Monad.Reader
import Database.Esqueleto
import Data.Maybe
import Model
import Prelude

userAvatarSize :: (Int, Int)
userAvatarSize = (280, 280)

getCurrentTeam :: MonadIO m => User -> ReaderT SqlBackend m (Maybe Team)
getCurrentTeam = maybeGet . userCurrentTeam

getAllStats :: MonadIO m => UserId -> SqlPersistT m [(Entity Season, Entity PlayerStats)]
getAllStats player =
    select . from $ \ (rs `InnerJoin` stu, ssn) -> do
        on (rs ^. RosterSpotStats ==. stu ^. PlayerStatsId)
        where_ (rs ^. RosterSpotPlayer ==. val player)
        where_ (ssn ^. SeasonId ==. rs ^. RosterSpotSeason)
        orderBy [asc $ ssn ^. SeasonStartDate]
        return (ssn, stu)
