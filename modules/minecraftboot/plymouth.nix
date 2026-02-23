{
 pkgs, 
 lib, 
 inputs,
 ... 
}:
  # Cool boot animation
{
  imports = [
    inputs.minecraft-plymouth.nixosModules.default
  ];
  # Make sure to add this to flake.nix inputs
  # minecraft-plymouth = {
  #   url = "github:nikp123/minecraft-plymouth-theme";
  #   inputs.nixpkgs.follows = "nixpkgs";
  # };
 
  # prevents `systemd-vconsole-setup` failing during systemd initrd
  console.earlySetup = true;
  systemd.services.systemd-vconsole-setup.unitConfig.After = "local-fs.target";
  boot = {

    plymouth = {
      enable = true;
      plymouth-minecraft-theme.enable = true;
    };

    # Enable "Silent boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    initrd.systemd.enable = true;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];

  };
}
