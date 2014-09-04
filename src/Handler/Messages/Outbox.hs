module Handler.Messages.Outbox where

import qualified Data.Aeson as A ((.=))
import Database.Esqueleto (Value (..))
import Handler.Messages.Common
import Import
import Text.Blaze.Html.Renderer.Text
import Types.Messages

getMessageOutboxR :: Handler Html
getMessageOutboxR = getMessageOutboxPageR 1

getMessageOutboxPageR :: Int -> Handler Html
getMessageOutboxPageR i = do
    let conf = pageconf i MessageOutboxR MessageOutboxPageR
    us <- requireAuth
    sent <- paginateWith conf $ \ msg -> do
        where_ (msg ^. MessageCreator ==. val (entityKey us))
        orderBy [desc (msg ^. MessageCreated)]

        let uids = subArray_select $ from $ \ (user `InnerJoin` rm) -> do
              on (user ^. UserId ==. rm ^. ReceivedMessageRecipient)
              where_ (rm ^. ReceivedMessageSource ==. msg ^. MessageId)
              return . sqlAsJson (undefined :: Recipient)
                  $ (user ^. UserName, user ^. UserCurrentTeamColor)

        return (msg, uids)

    defaultLayout $ do
        setTitle [shamlet|Sent messages|]
        messageLayout us Outbox $(widgetFile "messages/outbox")

getMessageSentR :: MessageId -> Handler Html
getMessageSentR mid = do
    user <- requireAuth
    msg <- runDB $ get404 mid
    (recipients, ct) <- runDB $ getRecipients mid (Just 10)
    defaultLayout $ do
        setTitle [shamlet|Outbox|]
        messageLayout user Outbox $(widgetFile "messages/sent")

postMessageRecipientsViewR :: MessageId -> Handler TypedContent
postMessageRecipientsViewR mid = do
    (recipients, _) <- runDB $ getRecipients mid Nothing
    rend <- getUrlRenderParams
    pcs <- mapM (widgetToPageContent . userLink . entityVal) recipients
    selectRep $ provideRep $ return $ toJSON $
        map (\ html -> object ["rendered" A..= renderHtml (pageBody html rend)]) pcs
