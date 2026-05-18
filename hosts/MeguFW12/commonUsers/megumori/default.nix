{
  pkgs,
  ...
}:
# Config specific to this user on this host
{
  imports = [
    ./niri.nix
    ./syncthing.nix
  ];

  users.users.megumori = {
    packages = with pkgs; [

    ];
  };
}
