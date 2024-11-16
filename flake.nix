{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        phiola = import ./default.nix {
          inherit (pkgs) stdenv lib fetchurl autoPatchelfHook;
          pkgs = pkgs;
        };
      in
      {
        packages.default = phiola;

        devShells.default = pkgs.mkShell {
          buildInputs = [
            phiola
          ];
        };
      });
}
