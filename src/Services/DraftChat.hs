module Services.DraftChat where

import Conduit
import Control.Concurrent.Lifted
import Control.Concurrent.STM.Lifted
import Data.Thyme
import Import
import qualified Types.Draft as Draft
import Yesod.WebSockets

sendChatMessage :: Entity User -> TChan Text -> Text -> WebSocketsT Handler ()
sendChatMessage eu tch t = do
    ct <- liftIO getCurrentTime
    let msg = DraftMessage (Draft.Message t) (entityKey eu) ct
    dk <- lift . runDB $ insert msg
    atomically $ writeTChan tch [st|#{show (Entity dk msg)}|]

runDraftChat :: Entity User -> Handler ()
runDraftChat e@(Entity _ user) = webSockets $ do
    tch <- fmap messages getYesod
    recent <- lift . runDB $ selectList [] [Asc DraftMessageCreatedAt]
    readChan_ <- atomically $ dupTChan tch
    atomically $ writeTChan tch [st|#{userName user} joined the chat|]
    forM_ recent $ \ t -> atomically $ writeTChan tch [st|#{show t}|]
    race_
        (forever $ do
            threadDelay 30000000
            v <- liftIO getZonedTime
            sendTextData [st|ping #{show v}|])
        (race_
            (forever $ atomically (readTChan readChan_) >>= sendTextData)
            (sourceWS $$ mapM_C (sendChatMessage e tch)))
