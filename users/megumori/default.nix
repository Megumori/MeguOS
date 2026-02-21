{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
# Define the user, import the other stuff
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
