{ self, ... }:
{
  flake.nixosModules.megumoriBasilConfiguration = {
    imports = with self.nixosModules; [
      megumoriBasilSyncthing
      megumoriBasilDesktop
    ];
  };
}
