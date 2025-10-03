{
  inputs,
  config,
  pkgs,
  specialArgs,
  ...
}:

{
  imports = [
  ./packages.nix
  ];

  home.username = "megumori";
  home.homeDirectory = "/home/megumori";
  home.stateVersion = "25.05";


  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Megumori";
    userEmail = "morialeo@proton.me";
  };

}
