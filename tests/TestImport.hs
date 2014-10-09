{-# LANGUAGE OverloadedStrings #-}
module TestImport
    ( module X
    , liftIO
    , logIn
    , runDB
    , Spec
    , Example
    , withFactory, withFactoryN
    ) where

import Control.Exception.Lifted
import Data.Text (Text)
import Data.Text as X (unpack)
import Types.User as X
import Control.Monad.Reader
import Test.Hspec as X (shouldSatisfy)
import Test.HUnit as X (assertBool)
import Yesod.Test as X
import Yesod.Auth
import Database.Persist as X hiding (get)
import Database.Persist.Sql (SqlPersistM, runSqlPersistMPool)
import Network.HTTP.Types.Method

import Foundation as X
import Model as X
import RandomDB as X

type Spec = YesodSpec App
type Example = YesodExample App

withFactory :: RandomDB a => (a -> Example b) -> Example b
withFactory act = do
    m <- runDB randomDB
    act m `finally` runDB (clean m)

withFactoryN :: RandomDB a => Int -> ([a] -> Example b) -> Example b
withFactoryN n act = do
    m <- runDB $ replicateM n randomDB
    act m `finally` runDB (mapM clean m)

runDB :: SqlPersistM a -> Example a
runDB query = do
    pool <- fmap connPool getTestYesod
    liftIO $ runSqlPersistMPool query pool

logIn :: Username -> Text -> Example ()
logIn u p = do
    request $ do
        setMethod methodPost
        setUrl . AuthR $ PluginR "hash" ["login"]
        addPostParam "username" (toText u)
        addPostParam "password" p
    statusIs 303
