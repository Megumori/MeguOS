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
  ];
}