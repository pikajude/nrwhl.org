module Handler.Verify where

import Import
import qualified Yesod as Y

getAuthVerifyR :: Username -> Text -> Handler Html
getAuthVerifyR username _key = do
    muser <- runDB $ getByUniqueUsername username
    case muser of
        Nothing -> defaultLayout $ do
            setTitle "Verify yourself"
            [whamlet|Username not recognized!|]
        Just (Entity _ user) | userVerified user -> do
            setMessage "You're already verified."
            redirect HomeR
        Just (Entity uid user) | userVerifyKey user == _key -> do
            runDB $ Y.update uid [UserVerified Y.=. True]
            setMessage "Welcome to narwHaL! You can log in now."
            redirect $ AuthR LoginR
        _ -> defaultLayout $ do
            setTitle "Verify yourself"
            [whamlet|That key doesn't look right, please try again.|]
