{ cabal, aeson, airbrake, aws, blazeHtml, blazeMarkup, conduit
, conduitCombinators, conduitExtra, dataDefault, emailValidate
, esqueleto, exceptions, fastLogger, hjsmin, hspec, httpClient
, httpConduit, httpTypes, imagemagick, lens, liftedBase
, markdown, mimeMail, mimeTypes, monadControl, monadLogger
, MonadRandom, mtl, pathPieces, persistent, persistentPostgresql
, persistentTemplate, pwstoreFast, processExtras, random
, resourcet, SHA, shakespeare, stmLifted, text, textNormal, thyme
, transformers, unorderedContainers, vectorSpace, waiExtra
, waiLogger, warp, yaml, yesod, yesodAuth, yesodCore, yesodForm
, yesodPagination, yesodStatic, yesodTest, yesodWebsockets

, cabalInstall, yesodBin, nodePackages, postgresql93

, preBuild ? ""

, src
}:

cabal.mkDerivation (self: {
  pname = "narwhal";
  version = "0.0.0";
  inherit src;
  isLibrary = true;
  isExecutable = true;
  buildTools = [
    nodePackages.coffee-script nodePackages.uglify-js
    postgresql93 cabalInstall
  ];
  buildDepends = [
    aeson airbrake aws blazeHtml blazeMarkup conduit conduitCombinators
    conduitExtra dataDefault emailValidate esqueleto exceptions fastLogger
    hjsmin httpClient httpConduit httpTypes imagemagick lens liftedBase
    markdown mimeMail mimeTypes monadControl monadLogger MonadRandom
    pathPieces persistent persistentPostgresql persistentTemplate
    processExtras pwstoreFast random resourcet SHA shakespeare stmLifted text
    textNormal thyme transformers unorderedContainers vectorSpace
    waiExtra waiLogger warp yaml yesod yesodAuth yesodCore yesodForm
    yesodPagination yesodStatic yesodWebsockets
  ];
  testDepends = [
    aeson dataDefault hspec httpTypes liftedBase monadControl
    monadLogger MonadRandom mtl persistent persistentPostgresql
    pwstoreFast random resourcet text textNormal thyme transformers
    yesod yesodAuth yesodCore yesodTest
  ];
  inherit preBuild;
  postInstall = ''
    cp -pR static $out/static
    cp -pR config $out/config
  '';
  doCheck = false;
  noHaddock = 1;
  meta = {
    platforms = self.ghc.meta.platforms;
    maintainers = [ "me@joelt.io" ];
  };
})
