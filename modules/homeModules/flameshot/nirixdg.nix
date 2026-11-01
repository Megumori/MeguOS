{
  flake.nixosModules.flameshotNiriXdg = {
    xdg.portal = {
      enable = true;
      wlr.enable = true;
      config = {
        niri = {
          "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
        };
      };
    };
  };
}
