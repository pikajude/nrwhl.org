module Model.Team where

import Control.Monad
import Data.Char
import qualified Database.Esqueleto as E
import Data.Maybe
import Data.Monoid
import Data.Text (Text)
import qualified Data.Text as T
import Model hiding (teamName)
import qualified Model as M
import Model.Auth
import Model.SqlFunctions
import Model.Season
import Prelude
import Types.Permissions
import Yesod

teamName :: Team -> Text
teamName t = (if teamThe t then "The " else "") <> M.teamName t

teamLogoSize :: (Int, Int)
teamLogoSize = (700, 700)

{-
- lots of shit can happen in here.
-
- * recruitPlayer sets the user's current team and team color, and adds
- a RosterSpot record.
-
- * releasePlayer removes a user's current team and color and deactivates
- the roster spot. it also revokes GM or AGM.
-
- * assignGM gives a user GM privileges and sets a team's current GM. it
- also calls recruitPlayer.
-
- * unassignGM removes a user's GM privileges and the team's current GM. it
- does not call releasePlayer.
-
- XXX: the {,un}assignGM functions are not perfectly bidirectional.
- a player can be on a team without being its GM, but cannot be the
- GM of a team without being on it.
-}

friendly :: Text -> Text
friendly = squeeze . T.map (\ c -> if isAlphaNum c then toLower c else '-') where
    squeeze t = if replaced == t then t else squeeze replaced where
        replaced = T.replace "--" "-" t

getCurrentPlayers :: (MonadResource m, E.MonadSqlPersist m)
                  => TeamId -> m [(Entity User, Entity PlayerStats)]
getCurrentPlayers t =
    E.select $ E.from $ \ (us `E.InnerJoin` rost, stat) -> do
        E.on (rost E.^. RosterSpotPlayer E.==. us E.^. UserId)
        E.where_ (rost E.^. RosterSpotStats E.==. stat E.^. PlayerStatsId)
        E.where_ (rost E.^. RosterSpotTeam E.==. E.val t)
        E.where_ (rost E.^. RosterSpotActive E.==. E.val True)
        E.orderBy [E.asc (lower (us E.^. UserName))]
        return (us, stat)

recruitPlayer :: (Functor m, PersistUnique m, PersistQuery m,
                  PersistMonadBackend m ~ E.SqlBackend) =>
                 UserId -> TeamId -> m ()
recruitPlayer u t = do
    updateWhere [RosterSpotPlayer ==. u] [RosterSpotActive =. False]
    currentRoster <- getBy (UniqueSeasonSpot u t currentSeasonId)
    case currentRoster of
        Just r -> void $ update (entityKey r) [RosterSpotActive =. True]
        Nothing -> do
            statId <- insert mempty
            void $ insert (RosterSpot u t statId currentSeasonId True)
    team <- get t >>= \ mt -> case mt of
        Nothing -> error "Unknown team given to recruitPlayer"
        Just t' -> return t'
    update u [UserCurrentTeam =. Just t, UserCurrentTeamColor =. Just (teamColor team)]

assignGM :: (PersistQuery m, E.MonadSqlPersist m, PersistUnique m, Functor m,
             PersistMonadBackend m ~ E.SqlBackend)
         => Entity Team -> UserId -> m ()
assignGM team uid = do
    case teamGm (entityVal team) of
        Just uk -> revokeGM uk
        Nothing -> return ()
    grantGM uid
    recruitPlayer uid (entityKey team)
    update (entityKey team) [TeamGm =. Just uid]

unassignGM :: (PersistQuery m, E.MonadSqlPersist m,
               PersistMonadBackend m ~ E.SqlBackend)
           => Entity Team -> m ()
unassignGM team = do
    case teamGm (entityVal team) of
        Just uk -> revokeGM uk
        Nothing -> return ()
    update (entityKey team) [TeamGm =. Nothing]

assignAGM :: (PersistQuery m, E.MonadSqlPersist m, PersistUnique m, Functor m,
             PersistMonadBackend m ~ E.SqlBackend)
         => Entity Team -> UserId -> m ()
assignAGM team uid = do
    case teamAgm (entityVal team) of
        Just uk -> revokeAGM uk
        Nothing -> return ()
    grantAGM uid
    recruitPlayer uid (entityKey team)
    update (entityKey team) [TeamAgm =. Just uid]

unassignAGM :: (PersistQuery m, E.MonadSqlPersist m,
                PersistMonadBackend m ~ E.SqlBackend)
            => Entity Team -> m ()
unassignAGM team = do
    case teamAgm (entityVal team) of
        Just uk -> revokeAGM uk
        Nothing -> return ()
    update (entityKey team) [TeamAgm =. Nothing]

releasePlayer :: (PersistQuery m, PersistMonadBackend m ~ E.SqlBackend)
              => UserId -> m ()
releasePlayer u = do
    user <- get u >>= \ mu -> case mu of
              Just u_ -> return u_
              Nothing -> error $ "Tried to release nonexistent user: " ++ show u
    team <- maybeGet (userCurrentTeam user) >>= \ mt -> case mt of
              Just t_ -> return $ Entity (fromJust $ userCurrentTeam user) t_
              Nothing -> error $ "Tried to release user from nonexistent team: "
                              ++ show (userCurrentTeam user)
    updateWhere [RosterSpotPlayer ==. u] [RosterSpotActive =. False]
    update u [ UserCurrentTeam =. Nothing
             , UserCurrentTeamColor =. Nothing
             , UserPermissions =. (userPermissions user) { pGM = False, pAGM = False }]
    when (teamGm (entityVal team) == Just u) $
        update (entityKey team) [ TeamGm =. Nothing ]
    when (teamAgm (entityVal team) == Just u) $
        update (entityKey team) [ TeamAgm =. Nothing ]

getTeamsWithStaff :: (MonadResource m, E.MonadSqlPersist m)
                  => m [(Entity Team, Maybe (Entity User), Maybe (Entity User))]
getTeamsWithStaff = E.select . E.from $
    \ (t `E.LeftOuterJoin` mgm `E.LeftOuterJoin` magm) -> do
        E.on (t E.^. TeamAgm E.==. magm E.?. UserId)
        E.on (t E.^. TeamGm E.==. mgm E.?. UserId)
        return (t, mgm, magm)
