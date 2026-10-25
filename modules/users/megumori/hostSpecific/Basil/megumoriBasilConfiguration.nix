{
  self,
  ...
}:
{
  flake.nixosModules.megumoriBasilConfiguration =
    { ... }:
    {
      imports = with self.nixosModules; [
        niri
        { niriConfigPath = ./config.kdl; }
        noctalia-shell
        { notificationsMonitor = [ "HDMI-A-1" ]; }
      ];
    };
}
