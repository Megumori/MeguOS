{
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.noctalia-shell2 = moduleWithSystem (
    {
      self',
      ...
    }:
    {
      lib,
      config,
      pkgs,
      ...
    }:
    {
      options = {
        notificationMonitors = lib.mkOption {
          type = lib.types.listOf lib.types.str;
          description = "Which monitors you want notifications on";
          example = ''[ "eDP-1" ]'';
        };
        usernameForNoctalia = lib.mkOption {
          type = lib.types.str;
          description = "username";
          example = "megumori";
        };
      };
      config = {
        users.users.${config.usernameForNoctalia}.packages = [
          self'.packages.noctalia-shell2
          pkgs.nixos-icons
          pkgs.cliphist
          pkgs.xwayland-satellite
        ];

        systemd.user.services.noctalia = {
          description = "Noctalia - A lightweight Wayland shell and bar";
          documentation = [ "https://docs.noctalia.dev/noctalia/" ];
          partOf = [ "graphical-session.target" ];
          after = [ "graphical-session.target" ];
          wantedBy = [ "graphical-session.target" ];
          serviceConfig = {
            ExecStart = lib.getExe self'.packages.noctalia-shell2;
            Restart = "on-failure";
          };
        };
      };
    }
  );
  perSystem =
    {
      pkgs,
      lib,
      ...
    }:
    {
      packages.noctalia-shell2 = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        package = pkgs.noctalia;
      };
    };
}
