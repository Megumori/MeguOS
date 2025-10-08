{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./networking.nix
    ./packages.nix
  ];

  users.users.megumori = {
    isNormalUser = true;
    description = "Megu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "openrazer"
    ];

  };
}
