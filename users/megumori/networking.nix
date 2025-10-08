{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{  
  # Apparently needed for protonvpn to work
  networking.firewall.checkReversePath = false;

  services.tailscale.enable = true;
}
