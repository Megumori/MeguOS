{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
#user regular packages
{
  imports = [
  ../../modules/steam.nix
  ../../modules/sunshine.nix
  ];

  services.tailscale.enable = true;
  
  users.users.megumori.packages = with pkgs; [
    ungit



    #messaging
    signal-desktop
    telegram-desktop

    #uni
    anki-bin
    mpv
    xournalpp
    python314
    jetbrains.pycharm-community-bin

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


    wget
  ];
}
