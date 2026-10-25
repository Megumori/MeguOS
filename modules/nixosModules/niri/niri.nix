{
  inputs,
  ...
}:
{
  flake.nixosModules.niri =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      options = {
        niriConfigPath = lib.mkOption {
          type = lib.types.path;
          description = "Path to the config.kdl for your system/user";
          example = "./config.kdl";
        };
      };
      config = {
        programs.niri = {
          enable = true;
          package = inputs.wrapper-modules.wrappers.niri.wrap {
            inherit pkgs;
            "config.kdl".path = config.niriConfigPath;
          };
        };
      };
    };
}
