{ supportedPlatforms ? [ "x86_64-linux" "x86_64-darwin" ]
, supportedCompilers ? ["ghc6104" "ghc6123" "ghc704" "ghc722" "ghc742" "ghc763" "ghc783" "ghcHEAD"]
, development ? false
, profiling ? false
}:

let
  pkgs = import <nixpkgs> {};
  genAttrs = pkgs.lib.genAttrs;
in rec {
  build = genAttrs supportedCompilers (ghcVer: genAttrs supportedPlatforms (system:
    let
      pkgs = import <nixpkgs> { inherit system; };
      profpath = x: if profiling then "${x}_profiling" else x;
      haskellPackages = pkgs.lib.getAttrFromPath [(profpath "haskellPackages_${ghcVer}")] pkgs;
    in haskellPackages.callPackage ./default.nix {
      preBuild = (pkgs.callPackage ./nix/bower.nix {}).link;
    }
  ));
}
