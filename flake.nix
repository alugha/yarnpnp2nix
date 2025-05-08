{
  description = "yarnpnp2nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = {
          yarn-plugin = pkgs.callPackage ./yarnPlugin.nix {};
        };
        lib = {
          mkYarnPackagesFromManifest = pkgs.callPackage ./lib/mkYarnPackage.nix { };
        };
        devShell = import ./shell.nix {
          inherit pkgs;
        };
      }
    );
}
