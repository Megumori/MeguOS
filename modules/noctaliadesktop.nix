{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [

  ];
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;
    wlr.enable = true;
  };
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-wlr
    pkgs.xdg-desktop-portal-gtk
  ];
  systemd.user.services.xdg-desktop-portal = {
    after = [ "xdg-desktop-autostart.target" ];
  };

  systemd.user.services.xdg-desktop-portal-gtk = {
    after = [ "xdg-desktop-autostart.target" ];
  };

  systemd.user.services.xdg-desktop-portal-gnome = {
    after = [ "xdg-desktop-autostart.target" ];
  };

}
