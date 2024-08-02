{
  config,
  lib,
  dream2nix,
  ...
}: {
  imports = [
    dream2nix.modules.dream2nix.nodejs-package-lock-v3
    dream2nix.modules.dream2nix.nodejs-granular-v3
  ];

  mkDerivation = {
    src = config.deps.fetchFromGitHub {
      owner = "myuimu";
      repo = "chip-nix";
      rev = "2345b0d199820b6a9d890f51b9f2241381ac6512";
      sha256 = "sha256-DSBt6X41nCOXERScHkKFIfUEUyRun2d07xeC0gwoqdY=";
    };
  };

  deps = {nixpkgs, ...}: {
    inherit
      (nixpkgs)
      fetchFromGitHub
      stdenv
      ;
  };

  nodejs-package-lock-v3 = {
    packageLockFile = "${config.mkDerivation.src}/package-lock.json";
  };

  name = "chip";
  version = "1.8.0";

  # Ecosystem-dependent package definition goes here
}