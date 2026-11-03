{
  flake.nixosModules.LavenderConfiguration = { pkgs, ... }: {
    imports = [ ./_hardware-configuration.nix ];

    #Config for tablet mode
    boot.initrd.kernelModules = [ "pinctrl_tigerlake" ];
    hardware.sensor.iio.enable = true;

    # Hardware specific packages
    environment.systemPackages = with pkgs; [
      framework-tool
      fw-ectool
      maliit-keyboard # keyboard for tablet mode
    ];

    #framework update
    services.fwupd.enable = true;
    # Needed for printer discovery
    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    zramSwap.enable = true;

    #Bluetooth
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          # Shows battery charge of connected devices on supported
          # Bluetooth adapters. Defaults to 'false'.
          Experimental = true;
          # When enabled other devices can connect faster to us, however
          # the tradeoff is increased power consumption. Defaults to
          # 'false'.
          FastConnectable = true;
        };
        Policy = {
          # Enable all controllers when they are found. This includes
          # adapters present on start as well as adapters that are plugged
          # in later on. Defaults to 'true'.
          AutoEnable = true;
        };
      };
    };
    services.blueman.enable = true;
  };
}
