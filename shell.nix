{ development ? false }:

let
  release = import ./release.nix { inherit development; };
  lib = (import <nixpkgs> {}).lib;
in lib.mapAttrs (_: attrs:
  lib.mapAttrs (ghcVer: byCompiler:
    lib.mapAttrs (system: bySystem:
      let
        pkgs = import <nixpkgs> { inherit system; };
        h = pkgs.lib.getAttrFromPath ["haskellPackages_${ghcVer}"] pkgs;
      in lib.overrideDerivation bySystem
        (attrs: { buildInputs = [ h.cabalInstall h.ghcMod h.scan h.yesodBin ] ++ attrs.buildInputs; }))
      byCompiler)
  attrs) release
