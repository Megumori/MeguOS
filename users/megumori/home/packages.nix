{
  pkgs,
  ...
}:
#user home packages
{
  imports = [
    # Custom modules
    ../../../homeModules/zenbrowser.nix
    ../../../homeModules/vscode.nix
    ../../../homeModules/obs.nix
    ../../../homeModules/neovim.nix
    ../../../homeModules/fuzzel.nix
    ../../../homeModules/vesktop.nix
    ../../../homeModules/terminal.nix
    ../../../homeModules/fastfetch
    # ../../../homeModules/lutris.nix
    ../../../homeModules/flameshot.nix
    ../../../homeModules/yazi.nix

  ];

  # Could have home packages down here
  home.packages = with pkgs; [

    #messaging
    signal-desktop
    telegram-desktop
    fluffychat
    cinny-desktop
    element-desktop

    #uni
    anki-bin
    mpv # needed for anki audio
    xournalpp
    rnote
    python314

    #gaming
    prismlauncher
    heroic

    #art
    krita
    inkscape

    #Tech shenanigans
    moonlight-qt
    wget
    easyeffects # audio
    localsend # Open firewall port 53317
    kdePackages.filelight
    wl-freeze

    #general
    libreoffice-qt
    obsidian
    qalculate-gtk

    #media
    vlc
    qimgv

    #vpn
    proton-vpn
    wireguard-tools
  ];
}
