{
  inputs,
  ...
}:
{
  flake.nixosModules.sddm =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    let
      cfg = config.modules.sddm;
    in
    {
      imports = [ inputs.silentSDDM.nixosModules.default ];

      options.modules.sddm =
        let
          inherit (lib) mkOption types;
        in
        {
          enable = mkOption {
            type = types.bool;
            default = true;
          };
          scale = mkOption {
            type = types.float;
            default = 1.0;
          };
          animBgUrl = mkOption {
            type = types.str;
            default = "https://motionbgs.com/dl/4k/7786";
          };
          animBgHash = mkOption {
            type = types.str;
            default = "sha256-bEItIYhqhTyWvAi9iLWK5+gOwgGKIyAJUpGf9B9on/U=";
          };
          animBgName = mkOption {
            type = types.str;
            default = "bg.mp4";
          };
          bgUrl = mkOption {
            type = types.str;
            default = "https://cloud.kruemmelspalter.org/apps/files_sharing/publicpreview/dTfJ7WKR9jXBgbs?file=/&fileId=309496&x=3200&y=1892&a=true&etag=4dc8df8bf7342198e96b94faf684b62a";
          };
          bgHash = mkOption {
            type = types.str;
            default = "sha256-slI3ESCZrbMj352radJiHFkqpIvrbkmPuySDsyog8wA=";
          };
          bgName = mkOption {
            type = types.str;
            default = "bg.jpg";
          };

          cursorTheme = mkOption {
            type = types.str;
            default = "catppuccin-mocha-dark-cursors";
          };
          cursorPackage = mkOption {
            type = types.package;
            default = pkgs.runCommand "moveUp" { } ''
              mkdir -p $out/share/icons
              ln -s ${
                pkgs.fetchzip {
                  url = "https://github.com/catppuccin/cursors/releases/download/v2.0.0/catppuccin-mocha-dark-cursors.zip";
                  hash = "sha256-EbBzbSBalFx6oo85I7at/wYyoGZuJxIbOWBNrfqHey0=";
                  extension = "zip";

                }
              } $out/share/icons/catppuccin-mocha-dark-cursors
            '';

          };
          cursorSize = mkOption {
            type = types.int;
            default = 24;
          };
          fontFamily = mkOption {
            type = types.str;
            default = "ComicCodeLigatures Nerd Font";
          };

          profileIcons = mkOption {
            type = types.attrsOf (types.either types.str types.package);
            default = { };
          };
        };

      config = lib.mkIf cfg.enable {

        services.displayManager.ly = {
          enable = lib.mkForce false;
        };
        environment.systemPackages = [ cfg.cursorPackage ];
        # qt.enable = true;
        services.displayManager.sddm = {
          # wayland.compositorCommand = "${lib.getExe' pkgs.kdePackages.kwin "kwin_wayland"} --drm --no-lockscreen --no-global-shortcuts --locale1";
          settings = {
            Theme = {
              CursorTheme = cfg.cursorTheme;
              CursorSize = cfg.cursorSize;
            };
          };

        };
        programs.silentSDDM = {
          enable = true;
          theme = "silvia";
          backgrounds = {
            bg = pkgs.fetchurl {
              name = cfg.animBgName;
              url = cfg.animBgUrl;
              hash = cfg.animBgHash;
            };
            bg-pl = pkgs.fetchurl {
              name = cfg.bgName;
              url = cfg.bgUrl;
              hash = cfg.bgHash;
            };

          };
          inherit (cfg) profileIcons;
          settings = {
            "General" = {
              animated-background-placeholder = cfg.bgName;
              scale = cfg.scale;
            };
            "LoginScreen" = {
              background = cfg.animBgName;
            };
            "LockScreen" = {
              background = cfg.animBgName;
              saturation = 0;
            };
            "LockScreen.Clock" = {
              font-family = cfg.fontFamily;
            };
            "LockScreen.Date" = {
              font-family = cfg.fontFamily;
            };
            "LockScreen.Message" = {
              font-family = cfg.fontFamily;
            };
            "LoginScreen.LoginArea.Avatar" = {
              shape = "square";
            };
            "LoginScreen.LoginArea.Username" = {
              font-family = cfg.fontFamily;
            };
            "LoginScreen.LoginArea.PasswordInput" = {
              font-family = cfg.fontFamily;
            };
            "LoginScreen.LoginArea.LoginButton" = {
              font-family = cfg.fontFamily;
            };
            "LoginScreen.LoginArea.Spinner" = {
              font-family = cfg.fontFamily;
            };
            "LoginScreen.LoginArea.WarningMessage" = {
              font-family = cfg.fontFamily;
            };
            "LoginScreen.LoginArea.Popups" = {
              font-family = cfg.fontFamily;
            };
            "Tooltips" = {
              font-family = cfg.fontFamily;
            };
          };
        };

      };
    };
}
