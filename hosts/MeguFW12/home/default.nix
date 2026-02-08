{
  inputs,
  config,
  pkgs,
  specialArgs,
  ...
}:
# Host specific homemanager stuff for all users (pretty rare)
{
  imports = [
    ./graphics.nix
  ];
}
