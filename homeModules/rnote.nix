{
  pkgs,
  ...
}:
{
  home.packages = [
    (pkgs.callPackage ../packages/rnote.nix { })
  ];
}