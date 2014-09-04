module Model.Auth (
    -- * permissions modification
    grantOtters, revokeOtters, grantAdmin, revokeAdmin,
    grantGM, revokeGM, grantAGM, revokeAGM,

    -- * permissions
    requireThat, enquireIf, can,

    administrate, release, editTeam, editUser,

    isGM, isAGM
) where

import Data.Int (Int64)
import Data.Maybe
import Data.Typeable
import qualified Database.Esqueleto as E
import Model
import Prelude
import Text.Shakespeare.Text
import Types.Permissions
import Yesod
import Yesod.Auth

requireThat :: (YesodAuth master, YesodPersist master, PersistEntity val,
                PersistStore (YesodPersistBackend master (HandlerT master IO)),
                Typeable val, AuthId master ~ KeyBackend
                    (PersistMonadBackend
                        (YesodPersistBackend master (HandlerT master IO))) val,
                PersistEntityBackend val ~ PersistMonadBackend
                   (YesodPersistBackend master (HandlerT master IO)))
            => (val -> Bool) -> HandlerT master IO (Entity val)
requireThat f = maybe (permissionDenied "Sorry, you can't do that.") return =<< hopeThat f

hopeThat :: (YesodAuth master, YesodPersist master, PersistEntity val,
             PersistStore (YesodPersistBackend master (HandlerT master IO)),
             Typeable val, AuthId master ~ KeyBackend
                 (PersistMonadBackend
                     (YesodPersistBackend master (HandlerT master IO))) val,
             PersistEntityBackend val ~ PersistMonadBackend
                (YesodPersistBackend master (HandlerT master IO)))
         => (val -> Bool) -> HandlerT master IO (Maybe (Entity val))
hopeThat f = do
    ma <- maybeAuth
    return $ case ma of
        Just e@(Entity _ u) -> if f u then Just e else Nothing
        Nothing -> Nothing

enquireIf :: (YesodAuth master, YesodPersist master, PersistEntity val,
              PersistStore (YesodPersistBackend master (HandlerT master IO)),
              Typeable val, AuthId master ~ KeyBackend
                  (PersistMonadBackend
                      (YesodPersistBackend master (HandlerT master IO))) val,
              PersistEntityBackend val ~ PersistMonadBackend
                 (YesodPersistBackend master (HandlerT master IO)))
          => (val -> Bool) -> HandlerT master IO Bool
enquireIf = fmap isJust . hopeThat

isOtters, isAdmin, isGM, isAGM :: User -> Bool
isOtters = pOtters . userPermissions
isAdmin = pAdmin . userPermissions
isGM = pGM . userPermissions
isAGM = pAGM . userPermissions

isGMOf :: TeamId -> User -> Bool
isGMOf t u = isGM u && userCurrentTeam u == Just t

can :: b -> (b -> c) -> c
can = flip ($)

editTeam :: TeamId -> User -> Bool
editTeam t u = isGMOf t u || administrate u

administrate :: User -> Bool
administrate u = isAdmin u || isOtters u

editUser :: User -> User -> Bool
editUser victim u = administrate u || u == victim

release :: User -> User -> Bool
release player u = (isGM u || isAGM u) && userCurrentTeam u == userCurrentTeam player

grantPermissions :: E.MonadSqlPersist m => Int64 -> UserId -> m ()
grantPermissions s uid = E.rawExecute
    [st|update "user" set "permissions" = "permissions" | ? where "user"."id" = ?|]
    [PersistInt64 s, unKey uid]

revokePermissions :: E.MonadSqlPersist m => Int64 -> UserId -> m ()
revokePermissions s uid = E.rawExecute
    [st|update "user" set "permissions" = "permissions" & ~? where "user"."id" = ?|]
    [PersistInt64 s, unKey uid]

grantOtters, revokeOtters, grantAdmin, revokeAdmin,
    grantGM, revokeGM, grantAGM, revokeAGM
  :: E.MonadSqlPersist m => UserId -> m ()
grantOtters = grantPermissions 1
revokeOtters = revokePermissions 1
grantAdmin = grantPermissions 2
revokeAdmin = revokePermissions 2
grantGM = grantPermissions 4
revokeGM = revokePermissions 4
grantAGM = grantPermissions 8
revokeAGM = revokePermissions 8
