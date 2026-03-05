{
  pkgs,
  config,
  ...
}:
# Niri and noctalia stuff
{
  imports = [
    ./noctalia.nix
  ];
  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}