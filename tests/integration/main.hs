{-# LANGUAGE ScopedTypeVariables #-}

import Application (makeApplication)
import Control.Concurrent
import Control.Exception
import Control.Monad
import Data.List (isInfixOf)
import Data.Word
import qualified HomeTest
import Prelude
import Network
import Network.Socket (PortNumber(PortNum))
import Network.Wai.Handler.Warp
import Settings (parseExtra)
import System.IO
import System.Process
import System.Random
import Test.WebDriver
import Yesod.Default.Config

main :: IO ()
main = withBrowsers [chrome, firefox]
    HomeTest.spec

withBrowsers :: [Browser] -> WD () -> IO ()
withBrowsers bs = withCaps (map (\b -> defaultCaps { browser = b }) bs)

withCaps :: [Capabilities] -> WD () -> IO ()
withCaps cs act = withApp $ \_ -> withSelenium $
    mapM_ (\c -> runSession defaultSession c act) cs

findAPort :: IO Word16
findAPort = do
    portNum <- randomRIO (50000, 60000)
    (do sock <- listenOn (PortNumber (PortNum portNum))
        sClose sock
        return (fromIntegral portNum))
      `catch` (\(_ :: IOException) -> findAPort)

withApp :: (Int -> IO a) -> IO a
withApp act =
    bracket (do config <- loadConfig (configSettings Testing) { csParseExtra = parseExtra }
                app <- makeApplication config
                p <- fmap fromIntegral findAPort
                tid <- forkIO $ runSettings defaultSettings
                    { settingsPort = p
                    , settingsHost = appHost config
                    } app
                return (p, tid)
                )
            (\(_,tid) -> killThread tid)
            (\(p,_) -> act p)

withSelenium :: IO a -> IO a
withSelenium act =
    bracket (do let loop h = do l <- hGetLine h
                                unless ("Started SocketListener" `isInfixOf` l) (loop h)
                (_,Just sout,_,h) <- createProcess $
                    (proc "selenium-server" ["-p", "4444"]) { std_out = CreatePipe }
                loop sout
                putStrLn "Started server."
                return h)
            (\h -> do
                putStrLn "Sending SIGINT to selenium process..."
                terminateProcess h
                _ <- waitForProcess h
                putStrLn "success.")
            (const act)
