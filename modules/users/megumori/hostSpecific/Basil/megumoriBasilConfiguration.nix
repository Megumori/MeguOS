{
  self,
  ...
}:
{
  flake.nixosModules.megumoriBasilConfiguration =
    { modulesPath, ... }:
    {
      imports = with self.nixosModules; [
        # Temporary
        {
          imports = [ (modulesPath + "/virtualisation/qemu-vm.nix") ];
          virtualisation.qemu.options = [
            "-device"
            "virtio-vga-gl"
            "-display"
            "sdl,gl=on"
          ];
        }
        # sddm
        # kde
        niri
        { niriConfigPath = ./config.kdl; }
        noctalia-shell
        {
          notificationMonitors = [ "HDMI-A-1" ];
          usernameForNoctalia = "megumori";
        }
      ];
    };
}
