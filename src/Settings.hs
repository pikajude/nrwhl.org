module Settings where

import Aws
import Control.Applicative
import Control.Lens
import Data.Default (def)
import Data.Monoid ((<>))
import Data.Text (Text)
import Data.Text.Lens
import Data.Yaml
import Database.Persist.Postgresql (PostgresConf)
import Language.Haskell.TH.Syntax
import Prelude
import Network.URI
import Settings.Development
import Text.Coffee
import Text.Hamlet
import Text.Shakespeare.Text (st)
import Yesod.Default.Config
import Yesod.Default.Util

type PersistConf = PostgresConf

staticDir :: FilePath
staticDir = "static"

staticRoot :: AppConfig DefaultEnv x -> Text
staticRoot conf =
    if development
        then [st|#{appRoot conf}/static|]
        else staticize (appRoot conf)

staticize :: Text -> Text
staticize t = t & unpacked . _URI . _uriAuthority . _Just . _uriRegName
                %~ ("static." <>)
    where
        _URI = prism' show parseURI
        _uriAuthority = lens uriAuthority (\ a b -> a { uriAuthority = b })
        _uriRegName = lens uriRegName (\ a b -> a { uriRegName = b })

widgetFileSettings :: WidgetFileSettings
widgetFileSettings = def
    { wfsHamletSettings = defaultHamletSettings
        { hamletNewlines = AlwaysNewlines
        }
    , wfsLanguages = \ hset -> defaultTemplateLanguages hset ++
        [ TemplateLanguage True "coffee"
              coffeeFile
              coffeeFileReload ]
    }

widgetFile :: String -> Q Exp
widgetFile = (if development then widgetFileReload
                             else widgetFileNoReload)
              widgetFileSettings

data Extra = Extra
    { extraAWSConfig :: Configuration
    , extraAWSBucket :: Text
    , extraAirbrakeHost :: String
    , extraAirbrakeKey :: String
    , extraUploadDomain :: Text
    }

parseExtra :: DefaultEnv -> Object -> Parser Extra
parseExtra _ o = Extra
    <$> pure (error "extraAWSConfig: should have been loaded during init")
    <*> o .: "aws-s3-bucket"
    <*> o .: "airbrake-host"
    <*> pure (error "extraAirbrakeKey: should have been loaded during init")
    <*> o .: "upload-domain"
