module Settings.StaticFiles where

import qualified Data.ByteString.Lazy.Char8 as B8
import Data.Default (def)
import Data.Either
import qualified Data.Text.Lazy.Encoding as TLE
import Filesystem.Path
import Language.Haskell.TH (Q, Exp, Name)
import Prelude (IO, error, flip, return, show, (.), ($), (++), Bool (..))
import Settings (staticDir)
import Settings.Development
import System.Exit
import System.Process.ByteString.Lazy (readProcessWithExitCode)
import Text.Lucius (luciusRTMinified)
import Text.Printf (printf)
import Yesod.Static
import qualified Yesod.Static as Static

staticSite :: IO Static.Static
staticSite = if development then Static.staticDevel staticDir
                            else Static.static staticDir

staticFiles Settings.staticDir

combineSettings :: CombineSettings
combineSettings = def
    { csCssPostProcess = \ fps ->
        either (error . errorIntro fps) (return . TLE.encodeUtf8)
      . flip luciusRTMinified []
      . TLE.decodeUtf8
    , csJsPostProcess = uglify
    }
    where
        errorIntro fps s = "Error minifying " ++ show fps ++ ": " ++ s

uglify :: [FilePath] -> B8.ByteString -> IO B8.ByteString
uglify paths code = do
    (status, out, err) <- readProcessWithExitCode "uglifyjs" ["-c", "-m"] code
    case status of
        ExitSuccess -> return out
        ExitFailure i -> error $ printf "Error minifying %s (shell exited %d): %s"
            (show paths) i (B8.unpack err)

combineStylesheets :: Name -> [Route Static] -> Q Exp
combineStylesheets = combineStylesheets' False combineSettings

combineScripts :: Name -> [Route Static] -> Q Exp
combineScripts = combineScripts' False combineSettings
