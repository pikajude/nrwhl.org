{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# OPTIONS_GHC -fno-warn-orphans -fno-warn-auto-orphans #-}

module Model.Instances.Debug where

import Data.ByteString (ByteString)
import Data.Conduit (Source)
import Data.Vault.Lazy
import Network.Wai.Internal
import Prelude (IO, Show (..))

deriving instance Show RequestBodyLength
deriving instance Show Request

instance Show (IO ByteString) where
    show _ = "<IO ByteString>"

instance Show Vault where
    show _ = "<vault>"

instance Show (Source a b) where
    show _ = "<source>"
