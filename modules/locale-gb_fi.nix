{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
# Locale settings, change stuff or make a new copy for different locales/layouts
{
  time.timeZone = lib.mkDefault "Europe/Helsinki";

  services.automatic-timezoned.enable = lib.mkDefault true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fi_FI.UTF-8";
    LC_IDENTIFICATION = "fi_FI.UTF-8";
    LC_MEASUREMENT = "fi_FI.UTF-8";
    LC_MONETARY = "fi_FI.UTF-8";
    LC_NAME = "fi_FI.UTF-8";
    LC_NUMERIC = "fi_FI.UTF-8";
    LC_PAPER = "fi_FI.UTF-8";
    LC_TELEPHONE = "fi_FI.UTF-8";
    LC_TIME = "fi_FI.UTF-8";
  };

  console = { # Layout for funky console shenanigans
    keyMap = "fi";
  };
  services.xserver.xkb = { # Layout for the rest. May need additional config in hyprland etc?
    layout = "fi";
    variant = "classic";
  };
}
