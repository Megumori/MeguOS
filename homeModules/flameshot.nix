{
  config,
  pkgs,
  ...
}:
{

  services.flameshot = {
    enable = true;
    package = pkgs.callPackage ../packages/flameshot14rc1/package.nix { };
    settings = {
      General = {
        # Settings can be found at https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini
        savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
        disabledTrayIcon = true;
        showStartupLaunchMessage = false;
        showDesktopNotification = true;
        showAbortNotification = true;
        showHelp = true;
        showSidePanelButton = true;
      };
    };
  };
  # Add this block if using niri to change the screenshot portal to one that plays nice with flameshot
  # xdg.portal = {
  #   enable = true;
  #   wlr.enable = true;
  #   config = {
  #     niri = {
  #       "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
  #     };
  #   };
  # };
}
