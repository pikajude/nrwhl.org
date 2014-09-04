module Handler.Draft where

import Import
import Services.DraftChat

getDraftR :: Handler Html
getDraftR = do
    aid <- requireAuth
    runDraftChat aid
    defaultLayout $(widgetFile "draft")
