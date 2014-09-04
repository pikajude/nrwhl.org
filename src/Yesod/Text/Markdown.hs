{-# OPTIONS_GHC -fno-warn-orphans -fno-warn-auto-orphans #-}

module Yesod.Text.Markdown where

import Data.Text (Text)
import Data.Text.Lazy (toStrict, fromStrict)
import Database.Persist.Sql
import Prelude
import Text.Hamlet (hamlet)
import Text.Markdown (Markdown (Markdown))
import Yesod.Core (HandlerSite, RenderMessage)
import Yesod.Core.Widget
import Yesod.Form

instance PersistField Markdown where
    toPersistValue (Markdown t) = PersistText $ toStrict t
    fromPersistValue (PersistText t) = Right $ Markdown $ fromStrict t
    fromPersistValue _ = Left "Not a PersistText value"

instance PersistFieldSql Markdown where
    sqlType _ = SqlString

markdownField :: (Monad m, RenderMessage (HandlerSite m) FormMessage) => Field m Markdown
markdownField = Field
    { fieldParse = parseHelper $ Right . Markdown . fromStrict
    , fieldView = \ theId name attrs val _isReq -> toWidget
        [hamlet|$newline never
<textarea id="#{theId}" name="#{name}" *{attrs}>#{either id extractStrict val}
|]
    , fieldEnctype = UrlEncoded
    }
     where
        extractStrict :: Markdown -> Text
        extractStrict (Markdown lt) = toStrict lt
