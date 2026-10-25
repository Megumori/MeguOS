{
  self,
  ...
}:
{
  flake.nixosModules.core = {
    imports = with self.nixosModules; [
      bootloader
      networking
      fonts
    ];
    system.stateVersion = "25.05";
    nix.settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
    zramSwap.enable = true;

  };
}
