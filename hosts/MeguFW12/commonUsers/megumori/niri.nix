{
  programs.niri.enable = true;
  # Needed to set screenshot portal to wlr for flameshot to work.
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config = {
      niri = {
        "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
      };
    };
  };
  # Actual configs etc handled by homemanager in ./home/nirictalia
}
