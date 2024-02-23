{
  description = "Chip, packaged with dream2nix";

  inputs = {
    dream2nix.url = "github:nix-community/dream2nix";
    nixpkgs.follows = "dream2nix/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    self,
    dream2nix,
    nixpkgs,
    flake-utils
    ...
  }: flake-utils.lib.eachDefaultSystem(system:
    let
    in {
      packages.${system}.default = dream2nix.lib.evalModules {
        packageSets.nixpkgs = inputs.dream2nix.inputs.nixpkgs.legacyPackages.${system};
        modules = [
          ./default.nix
          {
            paths.projectRoot = ./.;
            paths.projectRootFile = "flake.nix";
            paths.package = ./.;
          }
        ];
      };
    }
  )
}