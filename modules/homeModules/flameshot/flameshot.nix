{
  flake.homeModules.flameshot = { config, pkgs, ... }: {
    services.flameshot = {
      enable = true;
      package = pkgs.callPackage ./package/_package.nix { };
      settings = {
        General = {
          # Settings can be found at https://github.com/flameshot-org/flameshot/blob/master/flameshot.example.ini
          savePath = "${config.home.homeDirectory}/Media/Pictures/Screenshots";
          disabledTrayIcon = true;
          showStartupLaunchMessage = false;
          showDesktopNotification = true;
          showAbortNotification = true;
          showHelp = true;
          showSidePanelButton = true;
        };
      };
    };
  };
}
