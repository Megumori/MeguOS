{
  pkgs,
  ...
}:
# Home-manager config specific to this user on this host
{
  imports = [
    ./nirictalia
  ];
  home.packages = with pkgs; [
    rnote
  ];

}
