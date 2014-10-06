{ development ? false
, profiling ? false
}:

let
  release = import ./release.nix { inherit development profiling; };
  lib = (import <nixpkgs> {}).lib;
in lib.mapAttrs (_: attrs:
  lib.mapAttrs (ghcVer: byCompiler:
    lib.mapAttrs (system: bySystem:
      let
        pkgs = import <nixpkgs> { inherit system; };
        h = pkgs.lib.getAttrFromPath ["haskellPackages_${ghcVer}"] pkgs;
      in lib.overrideDerivation bySystem
        (attrs: {
          buildInputs = [
            h.cabalInstall h.ghcMod h.hlint h.scan h.yesodBin pkgs.nodePackages.bower
            pkgs.ruby21Libs.dotenv
          ] ++ attrs.buildInputs;
          NODE_PATH = "${pkgs.nodePackages.by-version.es5-ext."0.10.4"}/lib/node_modules";
          shellHook = ''
            ${(pkgs.callPackage ./nix/bower.nix {}).link}
            trap "git clean -fdx" EXIT
          '';
        }))
      byCompiler)
  attrs) release
