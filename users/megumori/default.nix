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
    inputs.catppuccin.nixosModules.catppuccin
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

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
  };

}
