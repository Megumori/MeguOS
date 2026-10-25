{
  flake.nixosModules.sddm =
    { lib, ... }:
    {
      services.displayManager.sddm = {
        enable = lib.mkForce true;
        wayland = {
          enable = true;
          compositor = "kwin";
        };
      };
    };
}
