{-# LANGUAGE OverloadedStrings #-}

module TitleTest (titleSpecs) where

import TestImport
import Text.XML.Cursor hiding (check)
import Yesod (Route)

titleSpecs :: Spec
titleSpecs = ydescribe "Titles ->" $ do
    check "Home" HomeR
    check "About" AboutR
    check "Register" AuthRegisterR
    checkF "Verify" $ \ u -> AuthVerifyR (userName u) (userVerifyKey u)

    checkF "Profile" $ UserViewR . userName
    checkF "Profile edit" $ UserEditR . userName

    check "Player list" PlayerFindR
    check "Player list: page" (PlayerFindPageR 2)

    checkF "Team view" $ TeamViewR . teamFriendlyName
    checkF "Team edit" $ TeamEditR . entityKey
    check "Team find" TeamFindR

    check "Inbox" MessageInboxR
    check "Inbox page" (MessageInboxPageR 2)
    check "Outbox" MessageOutboxR
    check "Outbox page" (MessageOutboxPageR 2)
    check "New message" MessageNewR
    checkF "Sent message" $ \ (Entity k _) -> MessageSentR k
    checkF "Recipients" $ \ (Entity k _) -> MessageRecipientsViewR k

checkF :: RandomDB a => String -> (a -> Route App) -> YesodSpec App
checkF n r = yit n $ withFactory (check_ . r)

check_ :: Route App -> YesodExample App ()
check_ r = withFactory $ \ u -> do
    logIn (userName (unAdminUser u)) "password"
    get r
    t <- htmlQuery "title"
    case t of
        [ts] -> liftIO $ case parseHTML ts $/ content of
            [x] -> assertBool ("Route " ++ show r ++ " has no set title")
                     $ x /= " \187 narwHaL"
            _ -> error "more than one title element, wtf lol?"
        _ -> printBody

check :: String -> Route App -> YesodSpec App
check h r = yit h (check_ r)
