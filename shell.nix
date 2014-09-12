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
        nodeDeps = pkgs.nodePackages.override {
          generated = ./nix/bower-deps.nix;
          self = nodeDeps;
        };
      in lib.overrideDerivation bySystem
        (attrs: {
          buildInputs = [
            h.cabalInstall h.ghcMod h.scan h.yesodBin nodeDeps.bower
          ] ++ attrs.buildInputs;
          # dunno why we need this but w/e
          NODE_PATH = "${nodeDeps.by-version.es5-ext."0.10.4"}/lib/node_modules";
        }))
      byCompiler)
  attrs) release
