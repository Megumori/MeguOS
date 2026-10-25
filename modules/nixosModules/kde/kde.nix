{
  flake.nixosModules.kde =
    {
      pkgs,
      lib,
      ...
    }:
    {
      services.displayManager.defaultSession = lib.mkForce "plasma";
      services.desktopManager.plasma6.enable = true;
      environment.plasma6.excludePackages = with pkgs.kdePackages; [
        konsole
        ark
        elisa
        gwenview
        okular
        kate
        ktexteditor
        khelpcenter
        dolphin
        baloo-widgets
        dolphin-plugins
        spectacle
        krdp
      ];
    };
}
