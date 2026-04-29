{
  ...
}:
# You could probably do more here
{
  # Apparently needed for protonvpn to work
  networking.firewall.checkReversePath = false;

  services.tailscale.enable = true;

  networking.firewall = {
    enable = true;
    # Ports for localsend
    allowedTCPPorts = [ 53317 ];
    allowedUDPPorts = [ 53317 ];
  };
}
