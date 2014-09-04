{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fno-warn-orphans -fno-warn-auto-orphans #-}

module Model.Setup.Development where

import Control.Applicative
import Control.Lens
import Control.Monad
import Control.Monad.IO.Class
import Control.Monad.Random
import Database.Persist
import Database.Persist.Sql
import Data.Monoid
import Data.Text (Text)
import qualified Data.Text.Lazy as L
import Data.Thyme
import Data.Thyme.Calendar.WeekDate
import Prelude
import Model
import Model.Season
import Text.Markdown
import Types.MessageHash
import Types.Permissions
import Types.Position
import Types.User

sendMessageFromTo_ :: (PersistQuery m, PersistMonadBackend m ~ SqlBackend)
                   => UserId -> [UserId] -> Text -> L.Text -> m ()
sendMessageFromTo_ s receivers title ct = do
    m <- liftIO getCurrentTime
    mid <- insert $ Message s title (Markdown ct) m
    forM_ receivers $ \ r -> do
        update r [UserUnreadMessageCount +=. 1]
        insert $ ReceivedMessage mid r True (MessageHash m (unKey s) (unKey r))

seedDevelopment :: (Functor m, PersistUnique m, PersistQuery m,
                    PersistMonadBackend m ~ SqlBackend) => m ()
seedDevelopment = seedPlayers
    -- seedSeason
    -- (seeded, ts) <- seedTeams
    -- unless seeded $ do
    --     adm <- seedAdmin
    --     keys <- seedPlayers ts

    --     -- Duplicated from Model/Message.hs due to type restrictions
    --     forM_ keys $ \ ks ->
    --         sendMessageFromTo_ adm ks "This is a test message!"
    --             [stext|Welcome to the site, everybody!|]

seedSeason :: (PersistStore m, PersistMonadBackend m ~ SqlBackend) => m ()
seedSeason = do
    s <- get currentSeasonId
    unlessMay s $ do
        curTime <- liftIO getCurrentTime
        let startTime = curTime & _utctDay . weekDate . _wdDay .~ 1
            endTime = startTime & _utctDay . weekDate . _wdWeek +~ 8
        insertKey currentSeasonId
            $ Season 1 startTime endTime

{-
seedTeams :: (PersistQuery m, PersistMonadBackend m ~ SqlBackend)
          => m (Bool, [Entity Team])
seedTeams = do
    c <- selectList [] []
    if null c
        then liftM (\ x -> (False, zipWith Entity x teams))
                 $ insertMany teams
        else return (True, c)
    where
        teams = [ Team n (friendly n) Nothing Nothing Nothing c
                | (n, c) <-
                    [ ("New York Islanders", "ffa500")
                    , ("Montreal Gremlins", "439871")
                    , ("Seal Team Six", "5e8d8c")
                    , ("Sendai Tsunamis", "0000ff")
                    , ("Snow Island Disco Penguins", "0066ff")
                    , ("Manic Pixie Dream Girls", "6be18b")
                    , ("Robot Bears", "663300")
                    , ("Helsinki Hellhounds", "ff660d")
                    , ("Bobtown Catfish", "46683c")
                    , ("Tiananmen Squares", "cccc00")

                    , ("Toronto Huskies", "0b2161")

                    , ("Savannah Peaches", "f38c58")
                    ]
                ]
-}

{-
seedAdmin :: (Functor m, PersistQuery m, PersistUnique m,
              PersistMonadBackend m ~ SqlBackend)
          => m UserId
seedAdmin = do
    t <- selectFirst [] []
    case t of
        Nothing -> error "No teams found after team seed"
        Just (Entity k _) -> do
            pw <- liftIO $ makePassword "password" 14
            d <- liftIO getCurrentTime
            let email = (\ (Right e) -> e) $ E.validate "me@joelt.io"
            uid <- insert $ User
                (fromText "otters")
                pw
                email
                True
                "verifykey"
                "resetkey"
                (Permissions True False False False)
                (Just Midfielder)
                (Just "http://i.imgur.com/EykD2N6.jpg")
                Nothing
                Nothing
                0
                d
                d
            recruitPlayer uid k
            return uid
-}

seedPlayers :: (PersistQuery m, PersistMonadBackend m ~ SqlBackend) => m ()
seedPlayers = do
    m <- count ([] :: [Filter User])
    when (m < 200) $ do
        g <- liftIO newStdGen
        let players = take 200 $ randoms g
        mapM_ insert (players :: [User])


-- utils

whenMay :: (Functor m, Monad m) => Maybe t -> (t -> m a) -> m ()
whenMay (Just t) f = void (f t)
whenMay Nothing _ = return ()

unlessMay :: Monad m => Maybe t -> m () -> m ()
unlessMay (Just _) _ = return ()
unlessMay Nothing f = f


-- random orphans

instance Random User where
    randomR _ = random
    random = runRand $ do
        t <- getRandom

        let password = "sha256|14|Mvuv57puwhTkxRJhVid9rg==|"
                    <> "LEVCTMnjJswhLuBRH9ZSu+wzAjVt/BqJ/nwi1DNKPq4="

        User <$> pure (fromText t)
             <*> pure password
             <*> getRandom
             <*> getRandom
             <*> getRandom
             <*> getRandom
             <*> pure (Permissions False False False False)
             <*> pure Nothing
             <*> pure Nothing
             <*> pure Nothing
             <*> pure Nothing
             <*> pure 0
             <*> getRandomR ( read "1990-01-01 00:00:00 UTC"
                            , read "2010-01-01 00:00:00 UTC" )
             <*> getRandomR ( read "1990-01-01 00:00:00 UTC"
                            , read "2010-01-01 00:00:00 UTC" )

instance Random Position where
    randomR _ = random
    random = runRand $ ([Forward, Midfielder, Goalkeeper] !!) <$> getRandomR (0, 2)

instance Random Permissions where
    randomR _ = random
    random = runRand $ Permissions <$> getRandom
                                   <*> getRandom
                                   <*> getRandom
                                   <*> getRandom

instance Random a => Random (Maybe a) where
    randomR p = runRand $ do
        i <- getRandom
        if i then getRandomR p else pure Nothing
    random = runRand $ do
        i <- getRandom
        if i then Just <$> getRandom else pure Nothing
