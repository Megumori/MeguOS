{
  ...
}:
{
  flake.nixosModules.bootloader = { ... }: {
    boot = {
      loader = {
        timeout = 2;
        efi.canTouchEfiVariables = true;
        grub = {
          enable = true;
          efiSupport = true;
          device = "nodev";
        };
      };
    };
  };
}
