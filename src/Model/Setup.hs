module Model.Setup (runSetup) where

import Control.Lens
import Control.Monad (when, void)
import Control.Monad.IO.Class
import Control.Monad.Logger
import Control.Monad.Trans.Control
import Control.Monad.Trans.Resource
import Data.Text (Text)
import Data.Thyme
import Data.Thyme.Calendar.WeekDate
import Database.Persist.Sql
import Model
import Model.Setup.Development
import Prelude
import Settings.Development
import Text.Shakespeare.Text

runSetup :: (MonadLogger m, MonadBaseControl IO m, MonadResource m)
         => SqlPersistT m ()
runSetup = do
    runMigration migrateAll
    addIndex "UNIQUE" "unique_ci_username"
        [st|"user" (lower(unaccent(name)) text_pattern_ops)|]
    makeSeason
    when (development && False) seedDevelopment

makeSeason :: (PersistUnique m, Functor m, PersistMonadBackend m ~ SqlBackend)
           => m ()
makeSeason = void $ do
    start <- liftIO getCurrentTime
    let startTime = start & _utctDay . weekDate . _wdDay .~ 1
        endTime = startTime & _utctDay . weekDate . _wdWeek +~ 8
    insertBy $ Season 1 startTime endTime

addIndex :: MonadSqlPersist m => Text -> Text -> Text -> m ()
addIndex ty idx body = rawExecute [st|DO $$
    BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_indexes WHERE indexname = ?
    ) THEN
        CREATE #{ty} INDEX #{idx} ON #{body};
    END IF;
    END$$;
|] [PersistText idx]
