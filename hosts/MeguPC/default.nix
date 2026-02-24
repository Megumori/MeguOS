{ 
  config,
  pkgs,
  ...
}:
# Base configs when it comes to the host machine, such as disk encryption etc
{
  imports = [
  ./hardware-configuration.nix
  ./packages.nix

  ../../modules/locale-gb_fi.nix

  ../../modules/sddm.nix
  ../../modules/plasma.nix

  ../../modules/plymouth.nix #Boot animation
  ];

  boot = {
    loader = {
	    efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
    };

    initrd = {
      # Needed to find the USB device during initrd stage
      kernelModules = [ "usb_storage" ]; 
      systemd.enable = true; # Enables password fallback for the encrypted devices (maybe some other stuff too idk)

      luks.devices = {
        luksroot = {
            device = "/dev/disk/by-uuid/400fdfd6-e31e-4ead-b02c-8ad1d6b89ac4";
            allowDiscards = true;
            keyFileSize = 4096;
            keyFile = "/dev/sdb";
        };
        cryptstorage = {
          device = "/dev/disk/by-uuid/ce9c8ab1-54a5-45b5-b566-7eaec2d50948";
          allowDiscards = true;
          keyFileSize = 4096;
          keyFile = "/dev/sdb";
	      };
      };
    };
  };

  # Automount 2nd ssd
  fileSystems."/mnt/satassd" = {
	device = "/dev/disk/by-uuid/42022788-fe4d-409f-a22f-46637c9d7ace";
	fsType = "ext4";
	options = [
	  "users"
	  "nofail"
	  "exec"
	];
  };

  zramSwap.enable = true;

  swapDevices = [
	  {  
      device = "/var/lib/swapfile";
      size = 16 * 1024; # 16GiB
	  }
  ];


  hardware.openrazer.enable = true;

  nixpkgs.config.allowUnfree = true;

  # NFS setup
  boot.supportedFilesystems = [ "nfs" ];
  fileSystems."/mnt/Jellyfin" = {
    device = "192.168.10.204:/Jellyfin";
    fsType = "nfs";
  };


	
}
