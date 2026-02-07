 	# Edit this configuration file to define what should be installed on
	# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
	imports = [
	# Include the results of the hardware scan.
	./hardware-configuration.nix
	./packages.nix
	];

	    # automount C & E drives
	# fileSystems."/run/media/leo/m2" = {
	# 	device = "/dev/disk/by-uuid/867E40A37E408DBD";
	# 	fsType = "ntfs-3g";
	# 	options = ["nofail"];
	# };
	fileSystems."/run/media/leo/sata" = {
		device = "/dev/disk/by-uuid/C6D060FCD060F459";
		fsType = "ntfs-3g";
		options = ["nofail"];
	};
	# fileSystems."/run/media/leo/secure" = {
	# 	device = "/dev/disk/by-uuid/d543b4a2-96d3-4f7c-8e10-c052360edd39";
	# 	options = ["nofail"];
	# };

	# Needed to find the USB device during initrd stage
  boot.initrd.kernelModules = [ "usb_storage" ]; 

  boot.initrd.luks.devices = {
      luksroot = {
         device = "/dev/disk/by-uuid/400fdfd6-e31e-4ead-b02c-8ad1d6b89ac4";
         allowDiscards = true;
         keyFileSize = 4096;
         keyFile = "/dev/sdb";
         fallbackToPassword = true;
      };
  };

	swapDevices = [{  
    device = "/var/lib/swapfile";
    size = 16 * 1024; # 16GB
  }];


	hardware.openrazer.enable = true;

# 	  # Bootloader.
# 	  boot.loader.grub.enable = true;
# 	  boot.loader.grub.device = "/dev/sda";
# 	  boot.loader.grub.useOSProber = true;
#
# 	  # Setup keyfile
# 	  boot.initrd.secrets = {
# 	    "/boot/crypto_keyfile.bin" = null;
# 	  };
#
# 	  boot.loader.grub.enableCryptodisk = true;
#
# 	  boot.initrd.luks.devices."luks-d2e16093-6af1-4725-a638-7eeea49fe565".keyFile =
# 	    "/boot/crypto_keyfile.bin";
#
	  nixpkgs.config.allowUnfree = true;

# 	  hardware.graphics = {
# 	    enable = true;
# 	  };
	}
