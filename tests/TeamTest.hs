{-# LANGUAGE OverloadedStrings #-}

module TeamTest (teamSpecs) where

import TestImport

teamSpecs :: Spec
teamSpecs = ydescribe "Team view page" $ do
    yit "shows a team" $ withFactory $ \ (Entity _ t) -> do
        get $ TeamViewR (teamFriendlyName t)
        statusIs 200
        htmlCount "small" 0 -- GM badge

    yit "updates display when a GM is assigned" $
        withFactory $ \ (TeamWithGm (Entity _ t, Entity _ u)) -> do
            get $ TeamViewR (teamFriendlyName t)
            statusIs 200
            htmlCount "small" 1
            htmlAnyContain "small" (unpack . toText $ userName u)
