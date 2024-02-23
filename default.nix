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

  deps = {nixpkgs, ...}: {
    (nixpkgs)
    fetchFromGitHub
    stdenv
    ;
  };

  nodejs-package-lock-v3 = {
    packageLockFile = "./package-lock.json";
  };

  name = "chip";
  version = "1.8.0";

  # Ecosystem-dependent package definition goes here
}