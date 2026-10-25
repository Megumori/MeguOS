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
            bar.main = {
              barType = "simple";
              position = "top";
              density = "default";
              floating = false;

              backgroundOpacity = 0;
              showOutline = false;
              showCapsule = true;
              capsuleOpacity = 1;
              capsuleColorKey = "none";

              marginVertical = 5;
              marginHorizontal = 5;
              frameThickness = 8;
              frameRadius = 12;
              outerCorners = true;

              displayMode = "always_visible";
              autoHideDelay = 500;
              autoShowDelay = 150;

              widgets = {
                left = [
                  {
                    id = "SystemMonitor";
                    compactMode = true;
                    diskPath = "/";
                    useMonospaceFont = true;

                    showCpuFreq = true;
                    showCpuTemp = true;
                    showCpuUsage = true;
                    showDiskUsage = true;
                    showDiskAvailable = false;
                    showDiskUsageAsPercent = false;

                    showMemoryUsage = true;
                    showMemoryAsPercent = false;
                    showSwapUsage = true;
                    showNetworkStats = true;

                    showGpuTemp = false;
                    showLoadAverage = false;
                  }

                  {
                    id = "MediaMini";
                    compactMode = false;
                    hideMode = "hidden";
                    hideWhenIdle = false;
                    maxWidth = 145;

                    scrollingMode = "hover";
                    showAlbumArt = true;
                    showArtistFirst = true;
                    showVisualizer = true;
                    visualizerType = "linear";
                    showProgressRing = true;
                  }
                ];

                center = [
                  {
                    id = "Workspace";
                    labelMode = "index";
                    hideUnoccupied = true;
                    showApplications = true;
                    showBadge = true;
                    characterCount = 2;
                    iconScale = 0.8;
                    pillSize = 0.6;
                  }

                  {
                    id = "Spacer";
                    width = 20;
                  }

                  {
                    id = "ActiveWindow";
                    hideMode = "hidden";
                    maxWidth = 145;
                    scrollingMode = "hover";
                    showIcon = true;
                  }
                ];

                right = [
                  {
                    id = "Tray";
                    drawerEnabled = true;
                    hidePassive = false;
                    blacklist = [ ];
                    pinned = [ ];
                  }

                  {
                    id = "NotificationHistory";
                    hideWhenZero = true;
                    showUnreadBadge = true;
                  }

                  {
                    id = "VPN";
                    displayMode = "onHover";
                  }

                  {
                    id = "Brightness";
                    displayMode = "onhover";
                  }

                  {
                    id = "Volume";
                    displayMode = "onhover";
                    middleClickCommand = "pwvucontrol || pavucontrol";
                  }

                  # {
                  #   id = "Network";
                  #   displayMode = "onhover";
                  # }
                  #
                  # {
                  #   id = "plugin:timer";
                  # }
                  #
                  {
                    id = "Battery";
                    deviceNativePath = "__default__";
                    displayMode = "graphic";
                    hideIfIdle = false;
                    hideIfNotDetected = true;
                  }

                  {
                    id = "Clock";
                    formatHorizontal = "HH:mm ddd, MMM dd";
                    formatVertical = "HH mm - dd MM";
                    tooltipFormat = "HH:mm ddd, MMM dd";
                    useCustomFont = false;
                  }

                  {
                    id = "ControlCenter";
                    useDistroLogo = true;
                  }

                ];
              };
            };

            general = {
              dimmerOpacity = 0.2;

              showScreenCorners = false;
              forceBlackScreenCorners = false;

              scaleRatio = 1;
              radiusRatio = 1;
              iRadiusRatio = 1;
              boxRadiusRatio = 1;
              screenRadiusRatio = 1;

              animationSpeed = 1;
              animationDisabled = false;

              compactLockScreen = false;
              lockOnSuspend = true;
              showSessionButtonsOnLockScreen = true;
              showHibernateOnLockScreen = true;

              enableShadows = true;
              shadowDirection = "bottom_right";
              shadowOffsetX = 2;
              shadowOffsetY = 3;

              allowPanelsOnScreenWithoutBar = true;
              showChangelogOnStartup = true;
              telemetryEnabled = false;

              enableLockScreenCountdown = true;
              lockScreenCountdownDuration = 10000;
              autoStartAuth = true;
              allowPasswordWithFprintd = true;

              clockStyle = "custom";
              clockFormat = "hh\nmm";
            };

            ui = {
              fontDefault = "ComicCodeLigatures Nerd Font";
              fontFixed = "ComicCodeLigatures Nerd Font";
              fontDefaultScale = 1;
              fontFixedScale = 1;

              tooltipsEnabled = true;
              panelBackgroundOpacity = 0.93;
              panelsAttachedToBar = true;
              settingsPanelMode = "attached";

              wifiDetailsViewMode = "grid";
              bluetoothDetailsViewMode = "grid";
              networkPanelView = "wifi";
              bluetoothHideUnnamedDevices = false;
              boxBorderEnabled = false;
            };

            location = {
              weatherEnabled = false;
            };

            audio = {
              volumeStep = 5;
              volumeOverdrive = true; # nix-shell -p pavucontrol if it doesn't let you go above 100%
              cavaFrameRate = 60;
              visualizerType = "linear";
              preferredPlayer = "";
              mprisBlacklist = [ ];
            };

            brightness = {
              brightnessStep = 5;
              enforceMinimum = true;
              enableDdcSupport = true;
            };

            colorSchemes = {
              darkMode = true;
              predefinedScheme = "Catppuccin";
              useWallpaperColors = false;
            };

            nightLight = {
              enabled = false;
            };

            dock = {
              enabled = true;
              position = "bottom";
              displayMode = "auto_hide";
              backgroundOpacity = 1;
              floatingRatio = 1;
              size = 1;
              onlySameOutput = true;
              pinnedApps = [ ];
            };

            notifications = {
              enabled = true;
              location = "top_right";
              overlayLayer = true;
              backgroundOpacity = 0.5;

              lowUrgencyDuration = 3;
              normalUrgencyDuration = 8;
              criticalUrgencyDuration = 15;
              respectExpireTimeout = false;
            };

            wallpaper = {
              enabled = true;
              overviewEnabled = true;
              showHiddenFiles = true;

              fillMode = "crop";
              fillColor = "#000000";
            };
          };
        }).wrapper;
    };
}
