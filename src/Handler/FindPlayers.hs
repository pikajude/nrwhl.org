{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Handler.FindPlayers where

import Database.Esqueleto.Internal.Sql
import Data.Function as F
import Data.Int
import Data.List as L
import qualified Data.HashMap.Strict as M
import Import hiding (Value)

getPlayerFindR :: Handler Html
getPlayerFindR = getPlayerFindPageR 1

getPlayerFindPageR :: Int -> Handler Html
getPlayerFindPageR i = do
    let unId :: TeamId -> String
        unId = show . unTeamKey
        conf = pageconf i PlayerFindR PlayerFindPageR

    teams' <- runDB $ selectList [] []

    let teams = M.fromList $
            map (\ k -> ([st|#{unId (entityKey k)}|], entityVal k)) teams'
        -- uncomment if we add divisions
        -- divisions = L.groupBy ((==) `F.on` (teamDivision . entityVal)) teams'
        teamof = (teams M.!) . pack . unId

    nameFilter <- fromMaybe "" <$> lookupGetParam "username"
    teamIds <- toIdList <$> lookupGetParams "team"

    players <- paginateWith conf $ \ user -> do
        unless (nameFilter == "") $
            where_ (sanitizeName (user ^. UserName)
                `like` (%) ++. sanitizeName
                    (val $ fromText nameFilter) ++. (%))

        unless (null teamIds) $
            where_ (user ^. UserCurrentTeam `in_` valList (map Just teamIds))

        orderBy [asc (user ^. UserId)]
        return (user :: SqlExpr (Entity User))

    defaultLayout $ do
        setTitle "Search for players"
        $(widgetFile "find-players")

toIdList :: [Text] -> [TeamId]
toIdList = mapMaybe readDec where
    readDec t = case fromPersistValue (PersistText t) of
        Left _ -> Nothing
        Right x -> Just x
