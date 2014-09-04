{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Main where

import Import
import Yesod.Default.Config
import Yesod.Test
import Test.Hspec
import Application (makeFoundation)

import HomeTest
import TeamTest
import TitleTest

main :: IO ()
main = hspec $ yesodSpecWithSiteGenerator generator $ do
    homeSpecs
    teamSpecs
    titleSpecs

generator :: IO App
generator = do
    conf <- Yesod.Default.Config.loadConfig $ (configSettings Testing)
                { csParseExtra = parseExtra
                }
    makeFoundation conf
