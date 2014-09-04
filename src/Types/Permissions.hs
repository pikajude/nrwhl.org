module Types.Permissions where

import Data.Aeson.TH
import Data.Bitmask
import Data.Default
import Database.Persist.Sql
import Prelude

data Permissions = Permissions
                 { pOtters :: Bool
                 , pAdmin :: Bool
                 , pGM :: Bool
                 , pAGM :: Bool
                 } deriving (Show, Eq)

instance Default Permissions where
    def = Permissions False False False False

mkBitmask ''Permissions
deriveJSON defaultOptions ''Permissions

instance PersistField Permissions where
    toPersistValue = PersistInt64 . permissionsToBits
    fromPersistValue (PersistInt64 i) = Right $ bitsToPermissions i
    fromPersistValue _ = Left "Could not convert non-int type to Permissions"

instance PersistFieldSql Permissions where
    sqlType _ = SqlInt32
