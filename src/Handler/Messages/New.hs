module Handler.Messages.New where

import qualified Data.Text as T
import qualified Data.Text.Read as T
import Data.Thyme (getCurrentTime)
import Handler.Messages.Common
import Import
import Network.HTTP.Types.Status (badRequest400)
import Types.MessageHash

getMessageReplyR :: MessageHash -> Handler Html
getMessageReplyR mid = do
    us <- requireAuth
    (src, sender_) <- runDB $ do
        msg_ <- getBy404 $ UniqueHash mid
        unless (receivedMessageRecipient (entityVal msg_) == entityKey us) $
            permissionDenied "You can't reply to that!"

        src <- getError "source message" . receivedMessageSource $ entityVal msg_
        sender' <- getError "user" $ messageCreator src
        return (src, Entity (messageCreator src) sender')

    (widget, enctype) <- generateFormPost $
        newMessageForm (entityKey us) (Just sender_) (Just src)

    defaultLayout $ do
        setTitle [shamlet|Replying to ##{snippet mid}|]
        messageLayout us NewMessage $(widgetFile "messages/new")

getMessageNewR :: Handler Html
getMessageNewR = do
    us <- requireAuth

    (widget, enctype) <- generateFormPost $ newMessageForm (entityKey us) Nothing Nothing

    defaultLayout $ do
        setTitle "New message"
        messageLayout us NewMessage $(widgetFile "messages/new")

postMessageNewR :: Handler Html
postMessageNewR = do
    us <- requireAuth

    ((res, widget), enctype) <- runFormPost $
        newMessageForm (entityKey us) Nothing Nothing

    case res of
        FormSuccess (rs, msg) -> do
            _ <- sendMessageTo msg rs
            redirect MessageOutboxR
        _ -> defaultLayout $ do
                setTitle "New message"
                messageLayout us NewMessage $(widgetFile "messages/new")

postMessageRecipientSearchR :: Handler TypedContent
postMessageRecipientSearchR = do
    query <- lookupPostParam "query"
    case query of
        Just qu | T.length qu >= 2 -> do
            users <- runDB . select . from $ \ user -> do
                where_ (sanitizeName (user ^. UserName)
                    `like` (%) ++. sanitizeName (val $ fromText qu) ++. (%))
                orderBy [asc (user ^. UserName)]
                return user
            selectRep . provideRep . return $ toJSON users
        _ -> sendResponseStatus badRequest400 [st|Query too short.|]

newMessageForm :: UserId -- sender
               -> Maybe (Entity User) -- recipient (from reply page)
               -> Maybe Message       -- source message (from reply page)
               -> Form ([UserId], Message)
newMessageForm uid recipient msg extra = do
    currentTime <- liftIO getCurrentTime

    let optList = (mkOptionList opts)
                { olReadExternal = (const Nothing ||| Just)
                                 . fmap (Key . PersistInt64 . fst) . T.decimal
                }
        opts = maybeToList
             $ fmap (\ (Entity k u) ->
                 Option (toText $ userName u) k (toPathPiece k)) recipient

    let subj = Just $ maybe "(no subject)" ("Re: " <>) $ fmap messageSubject msg

    (recipientsRes, recipientsView) <-
        mreq (multiSelectField $ return optList)
             (formControlAutofocus "To")
             (fmap (\ r -> [entityKey r]) recipient)
    (subjectRes, subjectView) <-
        mreq textField (formControl "Subject") subj
    (contentsRes, contentView) <-
        mreq markdownField (formControl "Message") Nothing

    let msgRes = Message
             <$> pure uid
             <*> subjectRes
             <*> contentsRes
             <*> pure currentTime
    return ((,) <$> recipientsRes <*> msgRes, $(widgetFile "messages/new-form"))
