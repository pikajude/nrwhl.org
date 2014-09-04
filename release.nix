{ supportedPlatforms ? [ "x86_64-linux" "x86_64-darwin" ]
, supportedCompilers ? ["ghc6104" "ghc6123" "ghc704" "ghc722" "ghc742" "ghc763" "ghc783" "ghcHEAD"]
, development ? false
}:

let
  pkgs = import <nixpkgs> {};
  genAttrs = pkgs.lib.genAttrs;
in rec {
  tarball = let
    darcsTag = builtins.substring 9 6
      (builtins.readFile ./_darcs/hashed_inventory);
    in with pkgs; derivation rec {
      system = builtins.currentSystem;
      name = "narwhal-tarball-${version}_${darcsTag}";
      version = "0.0.0";
      builder = ./tarball.sh;
      args = [ (builtins.toString ./.) ];
      buildInputs = [ darcs coreutils ];
    };

  build = genAttrs supportedCompilers (ghcVer: genAttrs supportedPlatforms (system:
    let
      pkgs = import <nixpkgs> { inherit system; };
      haskellPackages = pkgs.lib.getAttrFromPath ["haskellPackages_${ghcVer}"] pkgs;
    in haskellPackages.callPackage ./default.nix {
      src = if development then ./. else "${tarball}/dist.tar.gz";
    }
  ));
}
