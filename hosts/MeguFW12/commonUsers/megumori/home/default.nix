{
  pkgs,
  ...
}:
# Home-manager config specific to this user on this host
{
  imports = [
    ./nirictalia
    ./syncthing.nix
  ];
  home.packages = with pkgs; [
    rnote
  ];

}
