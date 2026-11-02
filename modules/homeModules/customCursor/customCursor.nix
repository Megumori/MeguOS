{
  flake.homeModules.customCursor =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    with lib;
    let
      cfg = config.modules.customCursor;

    in
    {
      options.modules.customCursor = {
        enable = mkEnableOption "Custom Cursor downloaded from URL";
        url = mkOption {
          type = types.str;
          default = "https://github.com/catppuccin/cursors/releases/download/v2.0.0/catppuccin-mocha-lavender-cursors.zip";
        };
        hash = mkOption {
          type = types.str;
          default = "sha256-riAE1yPUPKvhYy51EcNCSVUtGWrFzOpLfA2nquV7YSs=";
        };
        name = mkOption {
          type = types.str;
          default = "catppuccin-mocha-lavender-cursors";
        };
        filetype = mkOption {
          type = types.str;
          default = "zip";
        };
        size = mkOption {
          type = types.int;
          default = 24;
        };
      };

      config = mkIf cfg.enable {
        home.pointerCursor =
          let
            getFrom = url: hash: name: type: size: {
              gtk.enable = true;
              enable = true;
              x11.enable = true;
              inherit name;
              inherit size;
              package = pkgs.runCommand "moveUp" { } ''
                mkdir -p $out/share/icons
                ln -s ${
                  pkgs.fetchzip {
                    inherit url;
                    inherit hash;
                    extension = type;

                  }
                } $out/share/icons/${name}
              '';
            };
          in
          getFrom "${cfg.url}" "${cfg.hash}" "${cfg.name}" "${cfg.filetype}" cfg.size;
      };
    };
}
