module Model.User (
    -- * actual model stuff
    getCurrentTeam, getAllStats,

    userAvatarSize
) where

import Control.Monad
import Control.Monad.Trans.Resource hiding (release)
import qualified Database.Esqueleto as E
import Data.Maybe
import Model
import Prelude
import Yesod

userAvatarSize :: (Int, Int)
userAvatarSize = (280, 280)

getCurrentTeam :: (PersistStore m, PersistMonadBackend m ~ E.SqlBackend) =>
                  User -> m (Maybe Team)
getCurrentTeam = maybeGet . userCurrentTeam

getAllStats :: (MonadLogger m, MonadIO m, MonadBaseControl IO m, MonadThrow m,
                MonadResource m)
            => UserId -> E.SqlPersistT m [(Entity Season, Entity PlayerStats)]
getAllStats player =
    E.select . E.from $ \ (rs `E.InnerJoin` stu, ssn) -> do
        E.on (rs E.^. RosterSpotStats E.==. stu E.^. PlayerStatsId)
        E.where_ (rs E.^. RosterSpotPlayer E.==. E.val player)
        E.where_ (ssn E.^. SeasonId E.==. rs E.^. RosterSpotSeason)
        E.orderBy [E.asc $ ssn E.^. SeasonStartDate]
        return (ssn, stu)
