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
      # megumoriLavenderConfiguration

      LavenderConfiguration
      # BasilDesktop

      core
      printing
      locale_gb_fi
    ];
  };
}
