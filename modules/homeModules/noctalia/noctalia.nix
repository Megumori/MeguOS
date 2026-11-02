{
  inputs,
  ...
}:
{
  flake.homeModules.noctalia =
    {
      config,
      pkgs,
      ...
    }:
    let
      lib = inputs.nixpkgs.lib.extend (import ./_libcustom.nix);
      cfg = config.modules.noctalia;
      defaultSettings = {
        theme = {
          source = "builtin";
          builtin = "Catppuccin";
        };

        bar.main = {
          position = "top";

          background_opacity = 1;
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
            "group:g1"
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
              enabled = true;
              id = "g1";
              members = [
                "cpu"
                "cpu_temp"
                "ram_used"
                "swap_pct"
                "disk_used_root"
              ];
            }
          ];
        };

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
          disk_used_root = {
            type = "sysmon";
            stat = "disk_used";
            path = "/";
          };
          media = {
            title_scroll = "on_hover";
            hide_when_no_media = true;
          };
          taskbar = {
            group_by_workspace = true;
          };
          active_window = {
            title_scroll = "on_hover";
            color = "on_surface";
          };
          tray = {
            drawer = true;
          };
          keyboard_layout = {
            hide_when_single_layout = true;
          };
          battery = {
            display_mode = "";
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
            # tooltip_format = "";
          };
          control-center = {
            custom_image = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            custom_image_colorize = true;
          };
        };

        shell = {
          avatar_path = "${config.home.homeDirectory}/.face";

          screen_corners.enabled = true;
          launch_apps_as_systemd_services = true;

          shadow.direction = "bottom_right";

          font_family = cfg.font;

          session.actions = [
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

        desktop_widgets = {
          enabled = true;
        };

        nightlight = {
          enabled = true;
        };

        notifications = {
          background_opacity = 0.5;
        };

        wallpaper = {
          directory = "${config.home.homeDirectory}/Pictures/Wallpapers";

          fill_color = "#000000";
        };
      };
      package =
        (inputs.wrappers.wrapperModules.noctalia.apply {
          inherit pkgs;
          inherit (cfg) settings;
        }).wrapper;
    in
    {
      options.modules.noctalia = {
        enable = lib.mkEnableOption "Noctalia shell config";

        settings = lib.mkOption {
          description = "additional settings; overrides defaults";
          type = lib.custom.anythingWithMergeLists;
          default = { };
        };
        font = lib.mkOption {
          description = "What font to use in the shell";
          type = lib.types.str;
          default = "sans-serif";
        };

      };

      config = lib.mkIf cfg.enable {
        modules.noctalia.settings = lib.custom.mkDefaultRecursive defaultSettings;

        systemd.user.services.noctalia = {
          Unit = {
            Description = "Noctalia - A lightweight Wayland shell and bar";
            Documentation = "https://docs.noctalia.dev/v5/";
            PartOf = [ config.wayland.systemd.target ];
            After = [ config.wayland.systemd.target ];
          };
          Service = {
            ExecStart = lib.getExe package;
            Restart = "on-failure";
          };
          Install.WantedBy = [ config.wayland.systemd.target ];
        };

        home.packages = [
          package
          pkgs.nixos-icons
          pkgs.cliphist
          pkgs.xwayland-satellite
        ];

      };

    };
}
