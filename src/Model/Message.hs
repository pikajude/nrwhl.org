{-# LANGUAGE ScopedTypeVariables #-}

module Model.Message where

import Control.Applicative
import Control.Monad hiding (forM_)
import Control.Monad.Catch
import Control.Monad.IO.Class
import Data.Int
import Data.Foldable (forM_)
import qualified Data.Text as T
import Data.Text.Lazy.Builder (toLazyText, Builder)
import Data.Thyme
import Database.Esqueleto hiding ((=.), (-=.), (+=.), update)
import Model
import Prelude
import Text.Markdown
import Types.MessageHash
import Yesod hiding (Value, (==.))

getRecipients :: (MonadBaseControl IO m, MonadThrow m, MonadLogger m, MonadIO m,
                  MonadResource m)
              => MessageId -> Maybe Int64 -> SqlPersistT m ([Entity User], Int)
getRecipients mid lim = liftM2 (,)
    (select . from $ \ i -> do
        u <- filtr i
        forM_ lim limit
        return u)
    (fmap (unValue . head) . select . from $ \ i -> filtr i >> return countRows)
    where
        filtr (InnerJoin us rmsg) = do
            on (us ^. UserId ==. rmsg ^. ReceivedMessageRecipient)
            where_ (rmsg ^. ReceivedMessageSource ==. val mid)
            return us

sendMessageTo :: (YesodPersist site,
                  PersistQuery (YesodPersistBackend site (HandlerT site IO)),
                  PersistMonadBackend (YesodPersistBackend site (HandlerT site IO))
                      ~ SqlBackend)
              => Message -> [UserId]
              -> HandlerT site IO MessageId
sendMessageTo msg receivers = runDB $ do
    mid <- insert msg
    forM_ receivers $ \ r -> do
        update r [UserUnreadMessageCount +=. 1]
        insert $ ReceivedMessage mid r True
            (MessageHash (messageCreated msg) (unKey $ messageCreator msg) (unKey r))
    return mid

sendMessageFromTo :: (YesodPersist site,
                      PersistQuery (YesodPersistBackend site (HandlerT site IO)),
                      PersistMonadBackend (YesodPersistBackend site (HandlerT site IO))
                        ~ SqlBackend)
                  => UserId -> [UserId] -> T.Text
                  -> ((Route site -> [(T.Text, T.Text)] -> T.Text) -> Builder)
                  -> HandlerT site IO MessageId
sendMessageFromTo s receivers title ct_ = do
    ct <- toLazyText . ct_ <$> getUrlRenderParams
    m <- liftIO getCurrentTime
    let msg = Message s title (Markdown ct) m
    sendMessageTo msg receivers

setRead :: (PersistQuery m, PersistMonadBackend m ~ SqlBackend) =>
           Entity ReceivedMessage -> m ()
setRead (Entity rId rMsg) = when (receivedMessageUnread rMsg) $ do
    update (receivedMessageRecipient rMsg) [UserUnreadMessageCount -=. 1]
    update rId [ReceivedMessageUnread =. False]
