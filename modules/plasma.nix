{
  config,
  lib,
  pkgs,
  ...
}:
# Note to self: Make a home manager module with actual settings
{

  services.desktopManager.plasma6.enable = true;

}