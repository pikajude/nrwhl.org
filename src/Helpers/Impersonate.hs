module Helpers.Impersonate where

import Control.Applicative
import Database.Persist
import Data.Maybe
import Data.Text (unpack)
import Foundation
import Model
import Model.Auth
import Prelude
import Text.Shakespeare.Text hiding (toText)
import Types.User
import Yesod
import Yesod.Auth

setCreds_ :: YesodAuth master => Bool -> Creds master -> HandlerT master IO ()
setCreds_ f c = clearCreds f >> setCreds f c

impersonate :: UserId -> Handler ()
impersonate uid = do
    Entity (Key (PersistInt64 k)) _ <- requireThat (`can` administrate)
    m <- runDB $ get404 uid
    setCreds_ False $ Creds "hash" (toText $ userName m) []

    setSession impersonationKey [st|#{show k}|]

unpersonate :: Handler ()
unpersonate = do
    uid' <- (>>= readKey . unpack) <$> lookupSession impersonationKey
    deleteSession impersonationKey

    m <- case uid' of
             Nothing -> permissionDenied "Something's gone wrong."
             Just uid -> runDB $ get404 uid
    setCreds_ False $ Creds "hash" (toText $ userName m) []
    where
        readKey :: String -> Maybe UserId
        readKey s = case reads s of
                        ((x, _) : _) -> Just . Key $ PersistInt64 x
                        _ -> Nothing
