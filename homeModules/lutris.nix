{
  pkgs,
  config,
  ...
}:
{
  programs.lutris = {
    enable = true;
    extraPackages = with pkgs; [
      mangohud
      winetricks
    ];
    defaultWinePackage = pkgs.proton-ge-bin;
    protonPackages = with pkgs; [
      proton-ge-bin
    ];
    winePackages = with pkgs; [
      wineWow64Packages.full
    ];

  };
}