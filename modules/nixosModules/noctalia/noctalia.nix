{
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.noctalia-shell = moduleWithSystem (
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
          self'.packages.noctalia-shell
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
            ExecStart = lib.getExe self'.packages.noctalia-shell;
            Restart = "on-failure";
          };
        };
      };
    }
  );
  perSystem =
    {
      pkgs,
      ...
    }:
    {
      packages.noctalia-shell =
        (inputs.wrappers.wrapperModules.noctalia.apply {
          inherit pkgs;
          settings = {
            shell = {
              # avatar_path = "~/something";

              screen_corners.enabled = true;
              # launch_apps_as_systemd_services = true;

              shadow.direction = "bottom_right";

              font_family = "ComicCodeLigatures Nerd Font";

              sessions.actions = [
                { action = "lock"; }
                { action = "lock_and_suspend"; }
                {
                  action = "reboot";
                  destructive = true;
                }
                { action = "logout"; }
                {
                  action = "shutdown";
                  destructive = true;
                }
                {
                  action = "command";
                  label = "Reboot to UEFI";
                  command = "systemctl reboot --firmware-setup";
                  destructive = true;
                }
              ];
            };
            theme = {
              # mode = "dark";
              source = "wallpaper";
              # builtin = "Gruvbox";
              wallpaper_scheme = "m3_tonal_spot";
              templates = {
                enable_builting_templates = true;
                builtin_ids = [ "niri" ];
              };
            };
            wallpaper = {
              directory = ./wallpapers;
            };

            bar.main = {
              position = "top";

              backgroundOpacity = 1;

              capsule = true;
              capsule_opacity = 1;
              capsule_fill = "surface_variant";
              capsule_foreground = "primary";

              padding = 5;
              margin_edge = 5;
              margin_ends = 5;
              border_width = 0;
              radius = 12;

              widget_spacing = 5;

              start = [
                "group:g1" # Defined later
                "media"
                "active_window"
              ];

              center = [
                "taskbar"
              ];

              end = [
                "tray"
                "caffeine"
                "notifications"
                "wallpaper"
                "brightness"
                "keyboard_layout"
                "battery"
                "volume"
                "bluetooth"
                "network"
                "clock"
                "control-center"
              ];

              capsule_group = [
                {
                  id = "g1";
                  enabled = true;
                  members = [
                    "cpu"
                    "cpu_temp"
                    "ram_used"
                    "swap_pct"
                    "disk_used_pct"
                  ];
                }
              ];
            };

            # Find widget options at https://docs.noctalia.dev/noctalia/bar/widgets/
            widget = {
              cpu = {
                type = "sysmon";
                stat = "cpu_usage";
              };
              cpu_temp = {
                type = "sysmon";
                stat = "cpu_temp";
              };
              ram_used = {
                type = "sysmon";
                stat = "ram_used";
              };
              swap_pct = {
                type = "sysmon";
                stat = "swap_pct";
              };
              disk_used_pct = {
                type = "sysmon";
                stat = "disk_used_pct";
                path = "/";
              };

              taskbar = {
                group_by_workspace = true;
              };
              active_window = {
                title_scroll = "on_hover";
                hide_when_no_media = true;
              };
              tray = {
                drawer = true;
              };
              keyboard_layout = {
                hide_when_single_layout = true;
              };
              battery = {
                display_mode = "graphic";
              };
              bluetooth = {
                show_label = false;
              };
              network = {
                show_label = false;
              };
              clock = {
                format = "%H:%M:%S %Y-%m-%d";
                vertical_format = "%H %M - %d %M";
              };
              control-center = {
                custom_image = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                custom_image_colorize = true;
              };
            };

            lockscreen = {
              blurred_desktop = true;
            };

            audio = {
              enable_overdrive = true;
            };

            lockscreen_widgets = {
              enabled = true;
              widget = {
                clock = {
                  type = "clock";
                  cx = 960;
                  cy = 400;
                  settings.background_opacity = 0;
                  box_height = 200;
                  box_width = 400;
                };
              };
            };

            idle.behaviour = {
              lock = {
                timeout = 600;
                action = "lock";
                enabled = true;
              };
              screen-off = {
                timeout = 660;
                action = "screen_off";
                enabled = true;
              };
              suspend = {
                timeout = 900;
                action = "lock_and_suspend";
                enabled = true;
              };
            };
          };
        }).wrapper;
    };
}
