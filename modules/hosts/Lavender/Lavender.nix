{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.Lavender = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = with self.nixosModules; [
      homeManager
      homeMegumori

      megumori
      megumoriLavenderConfiguration

      sddm
      {
        modules.sddm = {
          scale = 0.5;
        };
      }

      LavenderConfiguration
      core
      printing
      locale_gb_fi
    ];
  };
}
