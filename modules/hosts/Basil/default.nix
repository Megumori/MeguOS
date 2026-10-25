{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.basil = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      basilConfiguration
      core

      # User specific configs
      megumoriBasilConfiguration
    ];
  };
}
