module Import
    ( module Import
    ) where

import Prelude as Import hiding (head, init, last,
                          readFile, tail, writeFile, sequence)
import Yesod as Import hiding (Route (..), (.=), (<.),
                        (||.), (>=.), (>.), (==.),
                        (=.), (<=.), (/=.), (-=.),
                        (+=.), (*=.), (!=.), delete, count,
                        update, selectSource)
import Yesod.Auth as Import
import Control.Applicative as Import (pure, (<$>), (<*>), liftA, liftA2, liftA3)
import Control.Arrow as Import
import Control.Monad as Import hiding (forM_, sequence)
import Data.Foldable as Import (forM_)
import Data.Function as Import hiding (on)
import Data.Maybe as Import hiding (isNothing)
import Data.Traversable as Import (sequence)
import Database.Esqueleto as Import hiding (set, (<&>), Value)
import Data.Ord as Import
import Data.Typeable as Import (Typeable)
import Data.Text as Import (Text, pack)
import Data.Text.Encoding as Import
import Text.Coffee as Import (coffee)
import Text.Shakespeare.Text as Import hiding (toText, text)
import Foundation as Import
import Handler.Error as Import (air)
import Helpers as Import
import Helpers.Impersonate as Import
import Model as Import hiding (teamName)
import Model.Auth as Import
import Model.PlayerStats as Import
import Model.Season as Import
import Model.Team as Import
import Model.Instances as Import
import Model.User as Import
import Model.Message as Import
import Model.SqlFunctions as Import
import Services.Upload as Import
import Settings as Import
import Settings.Development as Import
import Settings.StaticFiles as Import
import Text.Julius as Import (rawJS)
import Types.Permissions as Import
import Types.S3 as Import
import Types.Time as Import
import Types.User as Import
import Yesod.Paginate as Import
import Debug.Trace as Import
import Data.Monoid as Import (Monoid (mappend, mempty, mconcat), (<>))
import Yesod.Text.Markdown as Import

text :: Text -> Text
text = id

pageconf :: Int -> Route app -> (Int -> Route app) -> PageConfig app
pageconf = PageConfig 10
