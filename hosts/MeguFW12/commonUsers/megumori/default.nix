{
  pkgs,
  config,
  ...
}:
# Config specific to this user on this host
{
  imports = [
    ../../../../modules/noctaliadesktop.nix
  ];

  programs.niri.enable = true;

  users.users.megumori.packages = with pkgs; [
    
  ];
}