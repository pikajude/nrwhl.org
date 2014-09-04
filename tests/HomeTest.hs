{-# LANGUAGE OverloadedStrings #-}
module HomeTest
    ( homeSpecs
    ) where

import TestImport

homeSpecs :: Spec
homeSpecs =
    ydescribe "Every page" $
        yit "has an inbox link" $ withFactory $ \ (Entity _ u) -> do
            logIn (userName u) "password"
            get HomeR
            htmlAnyContain "#nrwhl-navbar a" "Profile"
            htmlAnyContain "#nrwhl-navbar a" "inbox"
