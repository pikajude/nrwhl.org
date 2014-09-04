module Handler.Admin where

import Import

redirectly :: Handler a -> Handler b
redirectly m = do
    setUltDestReferer
    _ <- m
    redirectUltDest HomeR

getAdminImpersonateStartR :: UserId -> Handler ()
getAdminImpersonateStartR uid = redirectly $ impersonate uid

getAdminImpersonateStopR :: Handler ()
getAdminImpersonateStopR = redirectly unpersonate

getAdminR :: Handler Html
getAdminR = do
    u <- requireThat (`can` administrate)
    defaultLayout [whamlet|#{show u}|]

postAdminR :: Handler Html
postAdminR = error "Not yet implemented: postAdminR"

getManagePlayersR :: Handler Html
getManagePlayersR = do
    us <- runDB $ selectList ([] :: [Filter User]) []
    defaultLayout [whamlet|#{show (length us)} #{show us}|]
