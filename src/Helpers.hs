{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE ViewPatterns #-}

module Helpers where

import Control.Arrow
import Data.AffineSpace
import Data.ByteString.Lazy (toStrict)
import Data.Char (isHexDigit)
import Data.Conduit (($$))
import Data.Conduit.Binary (sinkLbs)
import Data.Functor
import Data.Monoid
import qualified Data.Set as S
import Data.String
import Data.Text (Text, pack)
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import qualified Data.Thyme as Thyme
import Data.Thyme.Format.Human
import Foundation
import Model hiding (teamName)
import Model.PlayerStats
import Model.Team
import Prelude hiding (sequence)
import Settings
import Services.Resize
import Services.Upload
import System.Locale
import Text.Blaze (ToMarkup)
import Text.Coffee
import qualified Text.Email.Validate as E
import Text.Hamlet (ToAttributes)
import Text.Julius (rawJS)
import Text.Printf
import qualified Text.Shakespeare.Text as S
import Types.S3
import Types.User
import Yesod
import Yesod.Paginate

teamLink :: Team -> Widget
teamLink t = [whamlet|
  $newline never
  <a .team-link style="color: ##{teamColor t};" href=@{TeamViewR (teamFriendlyName t)}>#{teamName t}
|]

class UserColored u where
    uColor :: u -> Maybe Text
    uName :: u -> Username

instance UserColored User where
    uColor = userCurrentTeamColor
    uName = userName

instance (PersistEntity a, UserColored a) => UserColored (Entity a) where
    uColor = uColor . entityVal
    uName = uName . entityVal

userColored :: UserColored u => u -> Widget
userColored u = [whamlet|
$newline never
$maybe tc <- uColor u
  <span style="color: ##{tc}">#{uName u}
$nothing
  #{uName u}
|]

userLink :: UserColored u => u -> Widget
userLink u = [whamlet|$newline never
<a href=@{UserViewR (uName u)}>^{userColored u}|]

commas :: ToWidget App a => (t -> a) -> [t] -> Widget
commas _ [] = mempty
commas f [m] = [whamlet|^{f m}|]
commas f (m : ms) = [whamlet|^{f m}, ^{commas f ms}|]

pageLinks :: Page (Route App) r -> Widget
pageLinks page = [whamlet|
  <div .page-links .pull-right>
    $maybe ln <- firstPage page
      <div .btn-group>
        <a href=@{ln} role=button .btn .btn-xs .btn-default>&laquo;&laquo; first page

    <div .btn-group>
      $maybe ln <- previousPage page
        <a href=@{ln} role=button .btn .btn-xs .btn-default>&laquo; previous page
      $nothing
        <a role=button .btn .btn-default .btn-xs .disabled>&laquo; previous page
      $maybe ln <- nextPage page
        <a href=@{ln} role=button .btn .btn-xs .btn-default>next page &raquo;
      $nothing
        <a role=button .btn .btn-default .btn-xs .disabled>next page &raquo;
|]

statTable :: (ToWidget App a, ToWidget App c)
          => [b] -> a -> (b -> PlayerStats) -> (b -> c) -> Widget
statTable st tHeader extractStatsFunc headerFunc =
  let allStats = map (headerFunc &&& extractStatsFunc) st in
  [whamlet|
  <table .table .table-striped .table-bordered>
    <thead>
      <tr>
        <th .first>^{tHeader}
        <th title=Goals>G
        <th title=Assists>A
        <th title=Points>P
        <th title="Points per game">PPG
        <th title="Goals allowed">GA
        <th title="Goals allowed per game">GAA
        <th title="Team goal differential when player is on the field">+/-
        <th title="Minutes played on offense">MP/O
        <th title="Minutes played at GK">MP/GK
    <tbody>
      $forall (header, stats) <- allStats
        <tr>
          <td .first>^{header}
          <td>#{playerStatsGoals stats}
          <td>#{playerStatsAssists stats}
          <td>#{playerStatsPoints stats}
          <td>#{pack (printf "%.2f" (playerStatsPPG stats))}
          <td>#{playerStatsGoalsAllowed stats}
          <td>#{pack (printf "%.2f" (playerStatsGAA stats))}
          <td>#{pack (printf "%+d" (playerStatsPlusMinus stats))}
          <td title="games played: #{show (playerStatsGamesPlayedOffense stats)}">
            #{playerStatsTimePlayedOffense stats}
          <td title="games played: #{show (playerStatsGamesPlayedGk stats)}">
            #{playerStatsTimePlayedGk stats}
|]

s3Url :: Text -> Handler Text
s3Url t = do
    ex <- getExtra
    return $ "https://" <> extraUploadDomain ex <> "/" <> t

formatTime :: Thyme.FormatTime t => t -> String
formatTime = Thyme.formatTime defaultTimeLocale defaultFormat

defaultFormat :: String
defaultFormat = "%b %d, %Y %I:%M:%S %p"

friendlyTime :: Thyme.UTCTime -> Widget
friendlyTime t = do
    v <- liftIO Thyme.getCurrentTime
    let dif = v .-. t
    [whamlet|<span title=#{formatTime t}>#{humanTimeDiff dif} ago|]

formControlAutofocus :: String -> FieldSettings master
formControlAutofocus (formControl -> f) =
     f { fsAttrs = fsAttrs f ++ [("autofocus", "true")] }

formControl :: String -> FieldSettings master
formControl pl = ""
    { fsLabel = fromString pl
    , fsAttrs = [("class", "form-control"), ("placeholder", fromString pl)]
    }

imageDropField :: (Int, Int) -- desired image size
               -> Field (HandlerT App IO) Filename
imageDropField size = Field sParse (imgView size) Multipart where
    sParse _ [] = return $ Right Nothing
    sParse _ (info : _) =
        if fileContentType info `S.member` validImageTypes
            then do
                blob <- fmap toStrict $ fileSource info $$ sinkLbs
                newImg <- resizeTo size blob
                left SomeMessage . right Just
                    <$> uploadBlob newImg (fileContentType info)
            else return $ Left "You uploaded something that's not an image."

imgView :: (MonadWidget m, ToAttributes a2, ToMarkup a1, ToMarkup a, HandlerSite m ~ App)
        => (Int, Int) -> a -> a1 -> a2 -> Either Text Filename -> Bool
        -> m ()
imgView (w, h) id' nm attrs v req = toWidget [hamlet|
    <div #file-preview>
        <input id=#{id'} name=#{nm} *{attrs} type=file :req:required>
        $case v
            $of Left _
                <img src="holder.js/200x200/auto/text:#{w}x#{h}">
            $of Right r
                <img src=@{S3AssetR r}>
|]

validImageTypes :: S.Set Text
validImageTypes = S.fromList ["image/png", "image/jpeg"]

colorField :: Field (HandlerT App IO) Text
colorField = Field cParse cView UrlEncoded where
    cParse [color] _ = return $ case T.uncons color of
        Just ('#', c) | isColor c -> Right (Just c)
#ifndef HLINT
        _ -> Left $ SomeMessage [S.st|#{color} isn't a valid hex color.|]
#endif
    cParse _ _ = return $ Right Nothing
    text :: Text -> Text
    text = id
    cView iid nm attrs val req = do
        toWidget [hamlet|
          <div .row>
            <div .col-sm-2>
              <input id=#{iid} name=#{nm} *{attrs} value=#{either id (T.append "#") val}
                     type=color :req:required>
            <div .col-sm-10>
              <span id=#{iid}-hash>#{text "#"}
              <input id=#{iid}-color *{attrs} type=text value=#{either id id val}>
        |]
        toWidget [lucius|
          input##{iid} {
            padding: 2px 5px;
          }

          ##{iid}-hash {
            margin-left: -14px;
            margin-top: 4px;
            font-size: 18px;
            color: #666;
            position: absolute;
          }
        |]
        toWidget [coffee|
          isColor = (c) -> c.match /#[a-f0-9]{6}/i

          $("#%{rawJS iid}").on "change", ->
            hc = $(this).val()
            $(document).trigger "colorchange", hc if isColor(hc)
            c = hc.replace /^#/, ""
            $("#%{rawJS iid}-color").val c

          $("#%{rawJS iid}-color").on "keyup", ->
            c = "##{$(this).val()}"
            $(document).trigger "colorchange", c if isColor(c)
            $("#%{rawJS iid}").val c
        |]
    isColor t = T.length t == 6 && T.all isHexDigit t

validEmailField :: (RenderMessage (HandlerSite m) FormMessage, Monad m)
                => Field m E.EmailAddress
validEmailField = checkMMap
    (return . left T.pack . E.validate . T.encodeUtf8)
    (T.decodeUtf8 . E.toByteString)
    emailField
