{
 pkgs, 
 lib, 
 ... 
}:
  # Cool boot animation
{
 
  # prevents `systemd-vconsole-setup` failing during systemd initrd
  console.earlySetup = true;
  systemd.services.systemd-vconsole-setup.unitConfig.After = "local-fs.target";
  boot = {

    plymouth = {
      enable = true;
      theme = lib.mkForce "colorful_sliced"; #Change this
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "colorful_sliced" ]; #And this if you want a different theme. Spaces are _, themes found at https://github.com/adi1090x/plymouth-themes
        })
      ];
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
