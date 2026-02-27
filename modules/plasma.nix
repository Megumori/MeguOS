{
  config,
  lib,
  pkgs,
  ...
}:
# Note to self: Make a home manager module with actual settings (probably not actually. Would sooner switch to niri)
{

  services.desktopManager.plasma6.enable = true;

}