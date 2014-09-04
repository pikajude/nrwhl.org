module Handler.Admin.Teams where

import Control.Applicative
import Import

getManageTeamsR :: Handler Html
getManageTeamsR = do
    _ <- requireThat (`can` administrate)
    teams <- runDB getTeamsWithStaff
    defaultLayout $ do
        setTitle "Viewing all teams"
        $(widgetFile "admin/teams/list")

getManageTeamsNewR :: Handler Html
getManageTeamsNewR = do
    _ <- requireThat (`can` administrate)
    (widget, enctype) <- generateFormPost teamForm
    defaultLayout $ do
        setTitle "Create a new team"
        [whamlet|
          <form .form-horizontal role=form method=post enctype=#{enctype}
                                 action=@{ManageTeamsNewR}>
            <h1>Make a new team!
            ^{widget}
            <button type=submit .pull-right .btn .btn-default>Create team
        |]

postManageTeamsNewR :: Handler Html
postManageTeamsNewR = do
    _ <- requireThat (`can` administrate)
    ((res, widget), enctype) <- runFormPost teamForm
    case res of
        FormSuccess (team, gm, agm) -> do
            runDB $ do
                k <- insert team
                forM_ gm (assignGM (Entity k team) . entityKey)
                forM_ agm (assignAGM (Entity k team) . entityKey)
            redirect $ TeamViewR (teamFriendlyName team)
        _ -> defaultLayout $ do
            setTitle "Create a new team"
            [whamlet|
              <form .form-horizontal method=post enctype=#{enctype}
                                     action=@{ManageTeamsNewR}>
                ^{widget}
            |]

teamForm :: Form (Team, Maybe (Entity User), Maybe (Entity User))
teamForm extra = do
    (nameRes, nameView) <- mreq textField (formControl "Team name") Nothing
    let friendlyNameRes = fmap friendly nameRes
    (logoRes, logoView) <- mreq (imageDropField teamLogoSize) "Team logo" Nothing
    (gmRes, gmView) <- mopt
        (selectField $ optionsPersist [] [] userName)
        "GM" Nothing
    (agmRes, agmView) <- mopt
        (selectField $ optionsPersist [] [] userName)
        "AGM" Nothing
    (colorRes, colorView) <- mreq colorField (formControl "Team color") (Just "ffa900")
    (theRes, theView) <- mreq checkBoxField
        "Show 'the' before team name" (Just True)
    let teamRes = Team <$> nameRes
                       <*> friendlyNameRes
                       <*> logoRes
                       <*> fmap (fmap entityKey) gmRes
                       <*> fmap (fmap entityKey) agmRes
                       <*> colorRes
                       <*> theRes
    return (liftA3 (,,) teamRes gmRes agmRes, $(widgetFile "team/edit-form"))
