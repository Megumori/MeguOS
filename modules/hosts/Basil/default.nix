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
      homeManager
      homeMegumori

      megumori
      megumoriBasilConfiguration

      BasilConfiguration
      BasilDesktop
      core
      locale_gb_fi
    ];
  };
}
