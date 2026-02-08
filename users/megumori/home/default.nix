{
  inputs,
  config,
  pkgs,
  specialArgs,
  ...
}:
# Basic home manager configs
{
  imports = [
  ./packages.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "megumori";
    homeDirectory = "/home/megumori";
    stateVersion = "25.05"; # Original state version, read more in ./nixconfig/default.nix
  };


  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Megumori";
        email = "morialeo@proton.me";
      };
    };
  };

}
