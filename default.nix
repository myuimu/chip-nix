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
      rev = "c7db37fa3e2a741d14ffec45ab0971e9daba24d1";
      sha256 = "sha256-3BM17MwfUQwrUc/JLsmxTob5wSey5xmsHUdG1dOcqOU=";
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