{
  config,
  lib,
  pkgs,
  modulesPath,
  inputs,
  ...
}:

{
  boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
    pname = "minegrub";
    version = "1.0";
    src = pkgs.fetchFromGitHub {
      owner = "Lxtharia";
      repo = "minegrub-world-sel-theme";
      rev = "main";
      hash = "sha256-gBlP4aQQ0f3L6S1gWbidbflnp0p5hsJ8qmbyArZ8LO4=";
    };
    installPhase = "cp -r minegrub-world-selection $out";
  };
}