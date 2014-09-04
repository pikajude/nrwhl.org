module Handler.About where

import Import

getAboutR :: Handler Html
getAboutR = defaultLayout $ do
    setTitle "About narwHaL"
    [whamlet|narwHaL: North American something something Haxball something League|]
