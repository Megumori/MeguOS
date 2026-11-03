{
  self,
  ...
}:
{
  flake.nixosModules.megumoriPackages = { pkgs, ... }: {
    imports = with self.nixosModules; [
      thunar
    ];
    users.users.megumori.packages = with pkgs; [

      #messaging
      signal-desktop
      telegram-desktop
      fluffychat
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
      blender

      #Tech shenanigans
      moonlight-qt
      wget
      easyeffects # audio
      localsend # Open firewall port 53317
      kdePackages.filelight
      wl-freeze
      busybox

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
  };
}
