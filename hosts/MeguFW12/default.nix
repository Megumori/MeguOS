{ config, pkgs, lib, ... }:

{
	imports = [
	./hardware-configuration.nix
	./packages.nix

	../../modules/locale-gb_fi.nix

	../../modules/sddm.nix
	../../modules/plasma.nix

	../../modules/plymouth.nix #Boot animation
	];

	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};

	#Config for tablet mode
  boot.initrd.kernelModules = [ "pinctrl_tigerlake" ]; 
  hardware.sensor.iio.enable = lib.mkDefault true;
	#framework update
  services.fwupd.enable = true;

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

	nixpkgs.config.allowUnfree = true;
	
}
