{ config, pkgs, ... }:

{
	imports = [
	./hardware-configuration.nix
	./packages.nix
	];

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
		cryptstorage = {
			device = "/dev/disk/by-uuid/ce9c8ab1-54a5-45b5-b566-7eaec2d50948";
			allowDiscards = true;
			keyFileSize = 4096;
	        keyFile = "/dev/sdb";
    	    fallbackToPassword = true;
		};
	};

	fileSystems."/mnt/satassd" = {
		device = "/dev/disk/by-uuid/42022788-fe4d-409f-a22f-46637c9d7ace";
		fsType = "ext4";
		options = [
			"users"
			"nofail"
			"exec"
		];
	};

	swapDevices = [
		{  
    	device = "/var/lib/swapfile";
    	size = 16 * 1024; # 16GiB
		}
	];


	hardware.openrazer.enable = true;

	nixpkgs.config.allowUnfree = true;
}
