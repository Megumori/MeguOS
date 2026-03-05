{
  config,
  pkgs,
  inputs,
  lib,
  builtins,
  specialArgs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default

  ];
  home.packages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.nixos-icons
    pkgs.cliphist
    pkgs.xwayland-satellite

    pkgs.gpu-screen-recorder
  ];

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;

    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        screen-recorder = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        timer = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        niri-overview-launcher = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 1;
    };
    pluginSettings = {
      screen-recorder = {
        hideInactive = false;
        directory = "";
        filenamePattern = "recording_yyyyMMdd_HHmmss";
        frameRate = 30;
        audioCodec = "opus";
        videoCodec = "h264";
        quality = "high";
        colorRange = "limited";
        showCursor = true;
        copyToClipboard = false;
        audioSource = "default_output";
        videoSource = "portal";
        resolution = "original";
      };
      timer = {
        compactMode = false;
      };
    };

    settings = {
      settingsVersion = 48;

      bar = {
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
              id = "NoctaliaPerformance";
            }

            {
              id = "plugin:screen-recorder";
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
              id = "KeyboardLayout";
              displayMode = "onHover";
            }

            {
              id = "Battery";
              deviceNativePath = "__default__";
              displayMode = "graphic";
              hideIfIdle = false;
              hideIfNotDetected = true;
            }

            {
              id = "Volume";
              displayMode = "onhover";
              middleClickCommand = "pwvucontrol || pavucontrol";
            }

            {
              id = "Bluetooth";
              displayMode = "onhover";
              hideIfNotDetected = true;
            }

            {
              id = "Network";
              displayMode = "onhover";
            }

            {
              id = "plugin:timer";
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
        avatarImage = "/home/penguin/.face";
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
        name = "Wuerzburg";
        weatherEnabled = true;
        weatherShowEffects = true;
        useFahrenheit = false;
        firstDayOfWeek = 1;
        use12hourFormat = false;
        showWeekNumberInCalendar = false;
      };

      audio = {
        volumeStep = 5;
        volumeOverdrive = false;
        cavaFrameRate = 60;
        visualizerType = "linear";
        preferredPlayer = "";
        mprisBlacklist = [ ];
      };

      brightness = {
        brightnessStep = 5;
        enforceMinimum = true;
        enableDdcSupport = false;
      };

      colorSchemes = {
        darkMode = true;
        predefinedScheme = "Catppuccin";
        useWallpaperColors = false;
      };

      nightLight = {
        enabled = false;
        forced = false;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
        manualSunrise = "06:30";
        manualSunset = "18:30";
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

        monitors = [
          "HDMI-A-1"
        ];

        lowUrgencyDuration = 3;
        normalUrgencyDuration = 8;
        criticalUrgencyDuration = 15;
        respectExpireTimeout = false;
      };

      wallpaper = {
        enabled = true;
        overviewEnabled = true;
        directory = "/home/penguin/Media/Wallpapers";
        showHiddenFiles = true;

        fillMode = "crop";
        fillColor = "#000000";
        setWallpaperOnAllMonitors = true;

        automationEnabled = true;
        wallpaperChangeMode = "random";
        randomIntervalSec = 300;

        transitionDuration = 1500;
        transitionType = "random";
        transitionEdgeSmoothness = 0.05;
      };
    };
  };
}
