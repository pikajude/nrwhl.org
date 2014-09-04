{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE DefaultSignatures #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RankNTypes #-}

module RandomDB where

import Control.Applicative
import Control.Monad
import Control.Monad.IO.Class
import Control.Monad.Logger
import Control.Monad.Random
import Control.Monad.Trans.Resource
import Crypto.PasswordStore
import Database.Persist
import Database.Persist.Sql
import Data.Char
import Data.Default
import Data.Text (pack)
import Data.Thyme
import Model
import Model.Team
import Text.Markdown
import Types.User
import Types.Permissions
import Types.S3

type SqlCxt m = (MonadResource m, MonadLogger m)

class RandomDB a where
    randomDB :: SqlCxt m => SqlPersistT m a
#ifndef HLINT
    default randomDB :: (SqlCxt m, Random a) => SqlPersistT m a
#endif
    randomDB = liftIO randomIO

    clean :: SqlCxt m => a -> SqlPersistT m ()
    clean _ = return ()

instance (RandomDB a, PersistEntity a, PersistEntityBackend a ~ SqlBackend)
         => RandomDB (Entity a) where
    randomDB = do
        v <- randomDB
        k <- insert v
        return $ Entity k v

    clean (Entity a b) = do
        delete a
        clean b

instance (RandomDB a, RandomDB b) => RandomDB (a,b) where
    randomDB = liftM2 (,) randomDB randomDB
    clean (a,b) = clean a >> clean b

instance (RandomDB a, RandomDB b, RandomDB c) => RandomDB (a,b,c) where
    randomDB = liftM3 (,,) randomDB randomDB randomDB
    clean (a,b,c) = clean a >> clean b >> clean c


------------------------------------------------------------
-- some instances
------------------------------------------------------------

-------------------------------------
-- teams
-------------------------------------
newtype TeamWithGm = TeamWithGm { unTeamWithGm :: (Entity Team, Entity User) }
newtype TeamWithGmAndAgm = TeamWithGmAndAgm
    { unTeamWithGmAndAgm :: (Entity Team, Entity User, Entity User) }

instance RandomDB Team where
    randomDB = liftIO . evalRandIO $ do
        name <- pack . unwords <$> replicateM 3 teamWord
        color <- pack <$> replicateM 6 (getRandomR ('0', '9'))
        return $ Team name (friendly name) (Filename "dummy.png") Nothing Nothing
                      color True

teamWord :: MonadRandom m => m String
teamWord = pick [ "New", "York", "Islanders"
                , "Toronto", "Huskies"
                , "Tiananmen", "Squares"
                , "Sendai", "Tsunamis"

                , "Qatari", "Princes"
                , "Robot", "Bears"
                , "Buffalo", "Wings"
                , "Staten", "Island", "Shaolin"

                , "Savannah", "Peaches"
                , "Arizona", "Terror", "Drones"
                , "London", "Silly", "Nannies"
                , "Portland", "Pathfinders"
                ]

pick :: MonadRandom m => [b] -> m b
pick n = do
    idx <- getRandomR (0, length n - 1)
    return $ n !! idx

instance RandomDB TeamWithGm where
    randomDB = do
        eteam <- randomDB
        eu@(Entity ku _) <- randomDB
        assignGM eteam ku
        return $ TeamWithGm (eteam, eu)

    clean (TeamWithGm (t,u)) = do
        unassignGM t
        deleteWhere [ RosterSpotPlayer ==. entityKey u
                    , RosterSpotTeam ==. entityKey t ]
        delete (entityKey u)
        delete (entityKey t)

-------------------------------------
-- users
-------------------------------------
instance RandomDB User where
    randomDB = liftIO $ do
        g <- newStdGen
        (`evalRandT` g) $ do
            nm <- pack . take 8 . filter (not . isSpace) <$> getRandoms
            pw <- liftIO $ makePassword "password" 14
            e <- getRandom
            t <- liftIO getCurrentTime

            return $ User (fromText nm) pw e True "foo" "bar" def Nothing
                         Nothing Nothing Nothing 0 t t

newtype AdminUser = AdminUser { unAdminUser :: User }

instance RandomDB AdminUser where
    randomDB = do
        u <- randomDB
        return . AdminUser $ u { userPermissions = Permissions True False False False }


-------------------------------------
-- messages
-------------------------------------
instance RandomDB Message where
    randomDB = do
        u <- randomDB
        m <- liftIO getCurrentTime
        return $ Message (entityKey u) "Subject" (Markdown "contents") m

    clean m = do
        delete (messageCreator m)
        return ()
