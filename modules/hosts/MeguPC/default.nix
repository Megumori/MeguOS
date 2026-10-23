{
  self,
  inputs,
  ...
}:
{
  flake.nixosConfigurations.MeguPC = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      core
    ];
  };
}
