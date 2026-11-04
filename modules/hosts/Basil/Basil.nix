{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.Basil = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = with self.nixosModules; [
      { networking.hostName = "Basil"; }
      homeManager
      homeMegumori

      megumori
      megumoriBasilConfiguration

      sddm
      {
        modules.sddm = {
          scale = 0.5;
        };
      }

      BasilConfiguration
      core
      sops
      locale_gb_fi
    ];
  };
}
