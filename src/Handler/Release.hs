module Handler.Release where

import Import

postPlayerReleaseR :: Username -> Handler Html
postPlayerReleaseR uname = do
    Entity k user <- runDB (getByUniqueUsername uname) >>= \ u -> case u of
        Just pair -> return pair
        Nothing -> error $ "Tried to release user " ++ show uname ++ ", but none found."
    _ <- requireThat (`can` release user)
    runDB $ releasePlayer k
    redirect $ UserViewR (userName user)
