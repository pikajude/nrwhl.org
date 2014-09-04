module Handler.Messages.Inbox where

import Handler.Messages.Common
import Import
import Types.MessageHash

getMessageInboxR :: Handler Html
getMessageInboxR = getMessageInboxPageR 1

getMessageInboxPageR :: Int -> Handler Html
getMessageInboxPageR i = do
    let conf = pageconf i MessageInboxR MessageInboxPageR
    user <- requireAuth
    msgs <- paginateWith conf $ \ (rms `InnerJoin` ms `InnerJoin` u) -> do
        on (ms ^. MessageCreator ==. u ^. UserId)
        on (rms ^. ReceivedMessageSource ==. ms ^. MessageId)
        where_ (rms ^. ReceivedMessageRecipient ==. val (entityKey user))
        orderBy [desc (ms ^. MessageCreated)]
        return (rms, ms, u)
    defaultLayout $ do
        setTitle "Messages"
        messageLayout user Inbox $(widgetFile "messages/inbox")

getMessageReadR :: MessageHash -> Handler Html
getMessageReadR mid = do
    user <- requireAuth
    (recipients, src, sender_) <- runDB $ do
        msg_ <- getBy404 $ UniqueHash mid
        unless (receivedMessageRecipient (entityVal msg_) == entityKey user) $
            permissionDenied "That's not your message!"

        setRead msg_

        src <- getError "source message" . receivedMessageSource $ entityVal msg_
        sender' <- getError "user" $ messageCreator src
        (recipients, _) <- getRecipients (receivedMessageSource $ entityVal msg_) Nothing
        return (recipients, src, sender')

    defaultLayout $ do
        setTitle [shamlet|Reading message ##{snippet mid}|]
        messageLayout user Inbox $(widgetFile "messages/single")
