{
  pkgs,
  ...
}:
# Config specific to this user on this host
{
  imports = [
    ../../../../modules/noctaliadesktop.nix
    ./syncthing.nix
  ];

  programs.niri.enable = true;

  users.users.megumori.packages = with pkgs; [

  ];
}
