{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
#user nix packages
{
  imports = [ # custom modules
  ../../modules/steam.nix
  ../../modules/sunshine.nix
  ];
  
  # Remember to change name
  users.users.megumori.packages = with pkgs; [


    #messaging
    signal-desktop
    telegram-desktop

    #uni
    anki-bin
    mpv #needed for anki audio
    xournalpp
    python314
    jetbrains.pycharm-oss

    #gaming
    prismlauncher
    lutris

    #art
    krita

    #Tech shenanigans
    moonlight-qt
    wine

    #general
    libreoffice-qt
    obsidian
    bitwarden-desktop
    vlc
    obs-studio

    #vpn
    protonvpn-gui
    wireguard-tools
    
  ];
}
