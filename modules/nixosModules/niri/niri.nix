{
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.niri = moduleWithSystem (
    {
      self',
      ...
    }:
    {
      programs.niri = {
        enable = true;
        package = self'.packages.niri;
      };
    }
  );
  perSystem =
    {
      pkgs,
      ...
    }:
    { config, lib, ... }:
    {
      options = {
        niriConfigPath = lib.mkOption {
          type = lib.types.path;
          default = null;
          description = "Path to the config.kdl for your system/user";
        };
      };
      config = {
        packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
          inherit pkgs;
          "config.kdl".path = config.niriConfigPath;
        };
      };
    };
}
