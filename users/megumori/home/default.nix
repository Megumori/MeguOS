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
  inputs.catppuccin.homeModules.catppuccin
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


  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "lavender";
    vesktop.enable = false;
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-lavender-compact";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        size = "compact";
        accents = [ "lavender" ];
      };
    };
  };
  dconf.enable = true;

}
