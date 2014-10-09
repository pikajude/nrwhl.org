{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Main where

import Application (makeFoundation)
import Import
import System.Environment
import Test.Hspec
import Yesod.Default.Config
import Yesod.Test

import HomeSpec
import TeamSpec
import TitleSpec

main :: IO ()
main = withEnv [ ("PGHOST", "127.0.0.1")
               , ("PGPORT", "5432")
               , ("PGUSER", "narwhal")
               , ("PGDATABASE", "narwhal_test")
               ]
     $ hspec $ yesodSpecWithSiteGenerator generator $ do
    homeSpecs
    teamSpecs
    titleSpecs
    where
        withEnv pairs = (mapM_ (uncurry setEnv) pairs >>)

generator :: IO App
generator = do
    conf <- Yesod.Default.Config.loadConfig $ (configSettings Testing)
                { csParseExtra = parseExtra
                }
    makeFoundation conf
