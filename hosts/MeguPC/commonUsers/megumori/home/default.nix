{
  pkgs,
  ...
}:
# Home-manager config specific to this user on this host
{
  imports = [
    ./nirictalia
    ./retroarch
    ./syncthing.nix
  ];

  home.packages = with pkgs; [
    shticker-book-unwritten
    (pkgs.callPackage ../../../../../packages/vintagestory { })
  ];
}

