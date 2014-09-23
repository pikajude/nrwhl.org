{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# OPTIONS_GHC -fno-warn-orphans -fno-warn-auto-orphans #-}

module Model where

import Control.Applicative
import Control.Exception (throwIO)
import Control.Monad.Reader
import Control.Monad.Trans.Resource
import Data.Aeson.TH
import Data.ByteString (ByteString)
import Data.Maybe
import Data.Monoid
import Data.Text (Text)
import Data.Thyme (UTCTime)
import Data.Typeable (Typeable)
import Database.Esqueleto
import Database.Persist.Quasi
import Model.Instances
import Model.SqlFunctions
import Prelude
import Text.Email.Parser
import Text.Markdown
import qualified Types.Draft as Draft
import Types.MessageHash
import Types.Permissions
import Types.Position
import Types.S3
import Types.User
import Yesod
import Yesod.Core.Types (HandlerContents (HCError))

share [mkPersist sqlSettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")

deriveJSON defaultOptions { fieldLabelModifier = fromCamel . drop 4 } ''Team

instance ToJSON User where
    toJSON u = object
        [ "name" .= userName u
        , "position" .= userPosition u
        , "avatar" .= userAvatar u
        , "current_team" .= userCurrentTeam u
        , "current_team_color" .= userCurrentTeamColor u
        , "join_date" .= userJoinDate u
        , "last_seen_date" .= userLastSeenDate u
        ]

instance Monoid PlayerStats where
    mempty = PlayerStats 0 0 0 0 0 0
    mappend (PlayerStats a1 b1 c1 d1 e1 f1) (PlayerStats a2 b2 c2 d2 e2 f2)
        = PlayerStats (a1 + a2) (b1 + b2) (c1 + c2) (d1 + d2) (e1 + e2) (f1 + f2)

maybeGet :: (PersistEntity a, PersistStore (PersistEntityBackend a), MonadIO m)
         => Maybe (Key a) -> ReaderT (PersistEntityBackend a) m (Maybe a)
maybeGet = maybe (return Nothing) get

getError :: (PersistEntity b, PersistStore (PersistEntityBackend b), MonadIO m,
             Functor m)
         => String -> Key b -> ReaderT (PersistEntityBackend b) m b
getError s k = fromMaybe (error $ "Expected " ++ s ++ " with key "
                               ++ show k ++ ", none found") <$> get k


-- User-specific stuff ---------------
sanitizeName :: SqlExpr (Database.Esqueleto.Value Username)
             -> SqlExpr (Database.Esqueleto.Value Username)
sanitizeName = lower . unaccent

getByUniqueUsername :: (MonadIO m, MonadLogger m, MonadBaseControl IO m, MonadThrow m,
                        MonadResource m)
                    => Username -> SqlPersistT m (Maybe (Entity User))
getByUniqueUsername t = fmap listToMaybe . select . from $ \ us -> do
    where_ (sanitizeName (us ^. UserName)
        Database.Esqueleto.==. sanitizeName (val t))
    return us

getBy404UniqueUsername :: (MonadIO m, MonadLogger m, MonadBaseControl IO m, MonadThrow m,
                           MonadResource m)
                       => Username -> SqlPersistT m (Entity User)
getBy404UniqueUsername t = do
    u <- getByUniqueUsername t
    case u of
        Nothing -> liftIO $ throwIO $ HCError NotFound
        Just u' -> return u'
