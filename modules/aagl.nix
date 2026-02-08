{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{

  imports = [
    inputs.aagl.nixosModules.default
  ];

  # Extra prebuilt cache, since it's not in nixpkgs shockingly enough
  nix.settings = {
    extra-substituters = [
       "https://ezkea.cachix.org" 
    ];
    extra-trusted-public-keys = [
       "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];

  };
  # programs.honkers-railway-launcher.enable = true;
  # programs.anime-games-launcher.enable = true;

}
