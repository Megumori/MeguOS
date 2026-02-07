{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  services = {
    printing.enable = true;

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