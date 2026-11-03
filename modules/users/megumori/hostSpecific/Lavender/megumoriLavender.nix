{ self, ... }:
{
  flake.nixosModules.megumoriLavenderConfiguration = {
    imports = with self.nixosModules; [
      megumoriLavenderSyncthing
      megumoriLavenderDesktop
    ];
  };
}
