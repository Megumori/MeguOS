{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
# You could probably do more here
{  
  # Apparently needed for protonvpn to work
  networking.firewall.checkReversePath = false;

  services.tailscale.enable = true;
}
