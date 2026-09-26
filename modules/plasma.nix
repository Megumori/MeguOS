{
  pkgs,
  ...
}:
# Note to self: Make a home manager module with actual settings (probably not actually. Would sooner switch to niri)
{

  services.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    ark
    elisa
    gwenview
    okular
    kate
    ktexteditor
    khelpcenter
    dolphin
    baloo-widgets
    dolphin-plugins
    spectacle
    krdp
  ];
}
