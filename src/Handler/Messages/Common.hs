module Handler.Messages.Common where

import Import

data MessagePage = Inbox | Outbox | NewMessage deriving Eq

messageLayout :: Entity User -> MessagePage -> Widget -> Widget
messageLayout user page widget = $(widgetFile "messages/template") where
    isInbox = page == Inbox
    isOutbox = page == Outbox
    isNewMessage = page == NewMessage
