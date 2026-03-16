{
  pkgs,
  config,
  ...
}:
{
  services = {
    gvfs = {
      enable = true;
      package = pkgs.gvfs;
    }; # Required for removable media etc

    tumbler.enable = true; # Thumbnails
    udisks2.enable = true; # Mounting, probably enabled already elsewhere but just incase
  };

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
    ];
  };
  environment.systemPackages = with pkgs; [
    unrar
  ];

}