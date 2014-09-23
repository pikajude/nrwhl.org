module Handler.Report where

import Import

getReportR :: Handler Html
getReportR = defaultLayout $ do
    $(combineScripts 'StaticR
        [ angular_js
        , angular_sanitize_js
        , tv4_js
        , lib_ObjectPath_js
        , schema_form_js
        , bootstrap_decorator_min_js
        ])
    $(widgetFile "report")
