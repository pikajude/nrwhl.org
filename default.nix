{ stdenv, cabal, aeson, airbrake, aws, blazeHtml, blazeMarkup, conduit
, conduitCombinators, conduitExtra, dataDefault, emailValidate
, esqueleto, exceptions, fastLogger, hjsmin, hlint, hspec, httpClient
, httpConduit, httpTypes, imagemagick, lens, liftedBase
, markdown, mimeMail, mimeTypes, monadControl, monadLogger
, MonadRandom, mtl, pathPieces, persistent, persistentPostgresql
, persistentTemplate, pwstoreFast, processExtras, random
, resourcet, SHA, shakespeare, stmLifted, text, textNormal, thyme
, transformers, unorderedContainers, vectorSpace, waiExtra
, waiLogger, warp, yaml, yesod, yesodAuth, yesodCore, yesodForm
, yesodPagination, yesodStatic, yesodTest, yesodWebsockets

, bowerPreBuilder, cabalInstall, yesodBin, nodePackages, postgresql
}:

cabal.mkDerivation (self: {
  pname = "narwhal";
  version = "0.0.0";
  src = stdenv.lib.sourceFilesBySuffices ./. [
    ".cabal" ".coffee" ".eot" ".hamlet" ".hs" ".ico" ".julius" ".lucius" ".msg" ".png"
    ".svg" ".text" ".ttf" ".txt" ".woff" ".yml" "models" "routes"
  ];
  doCheck = false;
  noHaddock = true;
  isLibrary = true;
  isExecutable = true;
  buildTools = [
    nodePackages.coffee-script nodePackages.uglify-js
    postgresql cabalInstall
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
    aeson dataDefault hlint hspec httpTypes liftedBase monadControl
    monadLogger MonadRandom mtl persistent persistentPostgresql
    pwstoreFast random resourcet text textNormal thyme transformers
    yesod yesodAuth yesodCore yesodTest
  ];
  preBuild = bowerPreBuilder ./nix/bower.nix;
  postInstall = ''
    cp -pR static $out/static
    cp -pR config $out/config
  '';
  meta = {
    platforms = self.ghc.meta.platforms;
    maintainers = [ "me@joelt.io" ];
  };
})
