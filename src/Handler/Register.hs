module Handler.Register where

import Crypto.PasswordStore
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy.Char8 as B (fromStrict)
import Data.Char
import Data.Default
import Data.Digest.Pure.SHA
import qualified Data.Text as T
import qualified Data.Text.Encoding as T
import Data.Thyme (getCurrentTime)
import Handler.Mail
import Text.Hamlet
import Import
import System.IO

registerForm :: Form User
registerForm extra = do
    (emailRes, emailView) <-
        mreq validEmailField (formControlAutofocus "Email") Nothing
    (passwordRes, passwordView) <-
        mreq passwordConfirmField (formControl "Password") Nothing
    (usernameRes, usernameView) <-
        mreq (checkBool (not . T.all isSpace) ("can't be all spaces, you donut" :: Text)
               . checkM (\ x -> return (Right $ T.strip x :: Either FormMessage Text))
               $ textField)
             (formControl "Username")
             Nothing
    th <- liftIO getCurrentTime
    (vkey, rkey) <- liftIO $ withBinaryFile "/dev/urandom" ReadMode $ \ h ->
        join (***) (T.pack . show . sha1 . B.fromStrict) . B.splitAt 18
            <$> B.hGet h 36
    let user = User <$> fmap fromText usernameRes
                    <*> passwordRes
                    <*> emailRes
                    <*> pure False
                    <*> pure vkey
                    <*> pure rkey
                    <*> pure def
                    <*> pure Nothing
                    <*> pure Nothing
                    <*> pure Nothing
                    <*> pure Nothing
                    <*> pure 0
                    <*> pure th
                    <*> pure th
    return (user, $(widgetFile "register-form"))

getAuthRegisterR :: Handler Html
getAuthRegisterR = do
    (widget, enctype) <- generateFormPost registerForm
    defaultLayout $ do
        setTitle "Join"
        [whamlet|
<div>
    <form method=post enctype=#{enctype} action=@{AuthRegisterR}>
        ^{widget}
        <input type=submit .btn .btn-success value=Join>
|]

postAuthRegisterR :: Handler Html
postAuthRegisterR = do
    ((res, widget), enctype) <- runFormPost registerForm
    case res of
        FormMissing -> error "missing"
        FormFailure failures -> defaultLayout [whamlet|
<form method=post enctype=#{enctype} action=@{AuthRegisterR}>
  $forall err <- filter (T.isInfixOf "forgery") failures
    <p .alert .alert-danger>
      #{err}
  ^{widget}
  <input type=submit .btn .btn-success value=Join>
|]
        FormSuccess u -> do
            {- getByValue returns all entities that match *one* of
               the unique fields; i.e. email or username -}
            dupe <- runDB $ getByValue u
            if isJust dupe
                then defaultLayout $ do
                    setTitle "Registration error"
                    [whamlet|
                        <form method=post enctype=#{enctype} action=@{AuthRegisterR}>
                          <p .alert .alert-danger>That username or email is already taken!
                          ^{widget}
                          <input type=submit .btn .btn-success value=Join>
                    |]
                else greetUser u

greetUser :: User -> Handler Html
greetUser u = do
    err <- sendMail (userEmail u)
        "Welcome to narwHaL!"
        ($(textFile "templates/mail/register.text"),
         $(hamletFile "templates/mail/register.hamlet"))
    case err of
        Right () -> do
            _ <- runDB $ insert u
            setMessage "Welcome to narwHaL! Check your email."
            redirect HomeR
        Left _ -> defaultLayout $ do
            setTitle "Registration error"
            [whamlet|
                There was a problem sending you a verification email. The admins are
                resolving it now.
            |]

passwordConfirmField :: MonadIO m => Field m B.ByteString
passwordConfirmField = Field
    { fieldParse = \ vals _ -> case vals of
        [x, y] | x == y -> liftM (Right . Just) . liftIO
                    $ makePassword (T.encodeUtf8 x) 14
               | otherwise -> return $ Left "Passwords don't match"
        [] -> return $ Right Nothing
        _ -> return $ Left "Incorrect number of results"
    , fieldView = \ id' name attrs _ isReq ->
        [whamlet|
        <label for=#{id'} .sr-only>Password
        <input ##{id'} name=#{name} *{attrs} type=password :isReq:required>
        <label for=#{id'}-confirm .sr-only>Password (again)
        <input ##{id'}-confirm name=#{name} *{attrs}
            placeholder="Password (again)" type=password :isReq:required>
      |]
    , fieldEnctype = UrlEncoded
    }
