{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE ViewPatterns #-}
{-# OPTIONS_GHC -fno-warn-orphans -fno-warn-auto-orphans #-}

module Application (makeFoundation, main, getApplicationDev) where

import Import
import qualified Aws
import qualified Airbrake as Air
import Data.String (IsString)
import Control.Concurrent.STM.Lifted
import qualified Data.ByteString as B (null)
import Data.Default (def)
import Yesod.Default.Config
import Yesod.Default.Main
import Yesod.Default.Handlers
import Network.Wai.Middleware.RequestLogger
    (mkRequestLogger, outputFormat, OutputFormat (..), IPAddrSource (..), destination)
import qualified Network.Wai.Middleware.RequestLogger as RequestLogger
import qualified Database.Persist
import Network.HTTP.Conduit (newManager, conduitManagerSettings)
import Control.Monad.Logger (runLoggingT)
import Control.Monad.Trans.Resource (runResourceT)
import System.Log.FastLogger
import qualified Model.Setup as Setup
import Database.Persist.Postgresql
import Yesod.Core.Types (loggerSet, Logger (Logger))
import Network.Wai.Logger (clockDateCacher)

import Handler.About
import Handler.Admin
import Handler.Admin.Teams
import Handler.Draft
import Handler.FindPlayers
import Handler.Home
import Handler.ListTeams
import Handler.Messages
import Handler.Profile
import Handler.Register
import Handler.Release
import Handler.Report
import Handler.Team
import Handler.Team.Roster
import Handler.Verify

getS3AssetR :: Filename -> Handler ()
getS3AssetR _ = undefined

mkYesodDispatch "App" resourcesApp

makeApplication :: AppConfig DefaultEnv Extra -> IO Application
makeApplication conf = do
    foundation <- makeFoundation conf

    logWare <- mkRequestLogger def
        { outputFormat =
            if development
                then Detailed True
                else Apache FromSocket
        , destination = RequestLogger.Logger $ loggerSet $ appLogger foundation
        }

    logWare <$> toWaiAppPlain foundation

makeFoundation :: AppConfig DefaultEnv Extra -> IO App
makeFoundation conf_ = do
    conf <- (loadAwsConfigInto >=> loadAirbrakeConfigInto) conf_

    manager <- newManager conduitManagerSettings
    s <- staticSite

    dbconf <- Database.Persist.applyEnv $ PostgresConf "" 100
    when (B.null (pgConnStr dbconf))
        $ fail "no PG* variables in environment. restart with dotenv"
    p <- Database.Persist.createPoolConfig dbconf

    loggerSet' <- newStdoutLoggerSet defaultBufSize
    (getter, _) <- clockDateCacher
    tc <- newTChanIO

    let logger = Yesod.Core.Types.Logger loggerSet' getter
        foundation = App conf s p manager dbconf logger tc

    runLoggingT
        (runResourceT $ Database.Persist.runPool dbconf Setup.runSetup p)
        (messageLoggerSource foundation logger)

    return foundation

loadAwsConfigInto :: (MonadIO m, Functor m)
                  => AppConfig env Extra -> m (AppConfig env Extra)
loadAwsConfigInto a@AppConfig { appExtra = ex } = do
    creds_ <- (`Aws.loadCredentialsFromEnvOrFile` ckey) =<< Aws.credentialsDefaultFile
    case creds_ of
        Nothing -> error "Failed loading AWS credentials."
        Just creds -> do
            let config = Aws.Configuration Aws.Timestamp creds
                            (Aws.defaultLog Aws.Warning)
            return $ a { appExtra = ex { extraAWSConfig = config } }

loadAirbrakeConfigInto :: (MonadIO m, Functor m)
                       => AppConfig env Extra -> m (AppConfig env Extra)
loadAirbrakeConfigInto a@AppConfig { appExtra = ex } = do
    creds_ <- (`Air.loadCredentialsFromEnvOrFile` ckey) =<< Air.credentialsDefaultFile
    case creds_ of
        Nothing -> error "Failed loading Airbrake credentials."
        Just creds ->
            return a { appExtra = ex { extraAirbrakeKey = creds } }

ckey :: IsString a => a
ckey =
#ifdef DEVELOPMENT
    "nrwhl-dev"
#else
    "nrwhl"
#endif

getApplicationDev :: IO (Int, Application)
getApplicationDev =
    defaultDevelApp loader makeApplication
  where
    loader = Yesod.Default.Config.loadConfig (configSettings Development)
        { csParseExtra = parseExtra
        }

main :: IO ()
main = defaultMain (fromArgs parseExtra) makeApplication
