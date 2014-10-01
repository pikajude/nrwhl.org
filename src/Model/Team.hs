module Model.Team where

import Control.Monad
import Control.Monad.Reader
import Data.Char
import Database.Esqueleto
import qualified Database.Persist as P
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
import Yesod hiding ((==.))

teamName :: Team -> Text
teamName t = (if teamThe t then "The " else "") <> M.teamName t

teamLogoSize :: (Int, Int)
teamLogoSize = (700, 700)

{-
- lots of shit can happen in her
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

getCurrentPlayers :: MonadIO m
                  => TeamId -> SqlPersistT m [(Entity User, Entity PlayerStats)]
getCurrentPlayers t =
    select $ from $ \ (us `InnerJoin` rost, stat) -> do
        on (rost ^. RosterSpotPlayer ==. us ^. UserId)
        where_ (rost ^. RosterSpotStats ==. stat ^. PlayerStatsId)
        where_ (rost ^. RosterSpotTeam ==. val t)
        where_ (rost ^. RosterSpotActive ==. val True)
        orderBy [asc (lower (us ^. UserName))]
        return (us, stat)

recruitPlayer :: (MonadIO m, Functor m) => UserId -> TeamId -> ReaderT SqlBackend m ()
recruitPlayer u t = do
    updateWhere [RosterSpotPlayer P.==. u] [RosterSpotActive P.=. False]
    currentRoster <- getBy (UniqueSeasonSpot u t currentSeasonId)
    case currentRoster of
        Just r -> void $ P.update (entityKey r) [RosterSpotActive P.=. True]
        Nothing -> do
            statId <- insert mempty
            void $ insert (RosterSpot u t statId currentSeasonId True)
    team <- get t >>= \ mt -> case mt of
        Nothing -> error "Unknown team given to recruitPlayer"
        Just t' -> return t'
    P.update u [UserCurrentTeam P.=. Just t,
                UserCurrentTeamColor P.=. Just (teamColor team)]

assignGM :: (MonadIO m, Functor m)
         => Entity Team -> UserId -> ReaderT SqlBackend m ()
assignGM team uid = do
    case teamGm (entityVal team) of
        Just uk -> revokeGM uk
        Nothing -> return ()
    grantGM uid
    recruitPlayer uid (entityKey team)
    P.update (entityKey team) [TeamGm P.=. Just uid]

unassignGM :: MonadIO m => Entity Team -> ReaderT SqlBackend m ()
unassignGM team = do
    case teamGm (entityVal team) of
        Just uk -> revokeGM uk
        Nothing -> return ()
    P.update (entityKey team) [TeamGm P.=. Nothing]

assignAGM :: (MonadIO m, Functor m)
          => Entity Team -> UserId -> ReaderT SqlBackend m ()
assignAGM team uid = do
    case teamAgm (entityVal team) of
        Just uk -> revokeAGM uk
        Nothing -> return ()
    grantAGM uid
    recruitPlayer uid (entityKey team)
    P.update (entityKey team) [TeamAgm P.=. Just uid]

unassignAGM :: MonadIO m => Entity Team -> ReaderT SqlBackend m ()
unassignAGM team = do
    case teamAgm (entityVal team) of
        Just uk -> revokeAGM uk
        Nothing -> return ()
    P.update (entityKey team) [TeamAgm P.=. Nothing]

releasePlayer :: MonadIO m => UserId -> ReaderT SqlBackend m ()
releasePlayer u = do
    user <- get u >>= \ mu -> case mu of
              Just u_ -> return u_
              Nothing -> error $ "Tried to release nonexistent user: " ++ show u
    team <- maybeGet (userCurrentTeam user) >>= \ mt -> case mt of
              Just t_ -> return $ Entity (fromJust $ userCurrentTeam user) t_
              Nothing -> error $ "Tried to release user from nonexistent team: "
                              ++ show (userCurrentTeam user)
    updateWhere [RosterSpotPlayer P.==. u] [RosterSpotActive P.=. False]
    P.update u [ UserCurrentTeam P.=. Nothing
               , UserCurrentTeamColor P.=. Nothing
               , UserPermissions P.=. (userPermissions user) { pGM = False, pAGM = False }]
    when (teamGm (entityVal team) == Just u) $
        P.update (entityKey team) [ TeamGm P.=. Nothing ]
    when (teamAgm (entityVal team) == Just u) $
        P.update (entityKey team) [ TeamAgm P.=. Nothing ]

getTeamsWithStaff :: MonadIO m
    => SqlPersistT m [(Entity Team, Maybe (Entity User), Maybe (Entity User))]
getTeamsWithStaff = select . from $
    \ (t `LeftOuterJoin` mgm `LeftOuterJoin` magm) -> do
        on (t ^. TeamAgm ==. magm ?. UserId)
        on (t ^. TeamGm ==. mgm ?. UserId)
        return (t, mgm, magm)
