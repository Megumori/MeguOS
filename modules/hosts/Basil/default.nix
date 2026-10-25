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
      BasilConfiguration
      core
      locale_gb_fi

      # User specific configs
      megumori
      megumoriBasilConfiguration
    ];
  };
}
