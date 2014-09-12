module Handler.Report where

import qualified Data.Aeson as A
import Import

getReportR :: Handler Html
getReportR = do
    teams <- runDB $ selectList [] []
    let teamObjs = map (\ (Entity k t) ->
         object [ "id" A..= k
                , "name" A..= teamName t]
         ) teams
    defaultLayout $ do
        $(combineScripts 'StaticR
            [ angular_js
            , angular_sanitize_js
            , tv4_js
            , lib_ObjectPath_js
            , schema_form_js
            , bootstrap_decorator_min_js
            ])
        $(widgetFile "report")
