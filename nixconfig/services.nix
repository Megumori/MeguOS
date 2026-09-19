{
  pkgs,
  ...
}:
# Basic services for all machines
{
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        splix # For old samsung printer
        samsung-unified-linux-driver
        (writeTextDir "share/cups/model/yourppd.ppd" (builtins.readFile ./printerdrivers/Samsung_M2070_Series.ppd))
      ];
    };

    # Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Touchpad support
    libinput.enable = true;

  };
}

