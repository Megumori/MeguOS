{
  pkgs,
  config,
  ...
}:
# Home-manager config specific to this user on this host
{
  imports = [
    ./nirictalia
    ./retroarch
    ./syncthing.nix
    ../../../../../homeModules/vintagestory.nix
  ];

  home.packages = with pkgs; [
    shticker-book-unwritten
  ];
}