{
  self,
  ...
}:
{
  flake.nixosModules.core =
    {
      pkgs,
      ...
    }:
    {
      imports = with self.nixosModules; [
        bootloader
        networking

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
