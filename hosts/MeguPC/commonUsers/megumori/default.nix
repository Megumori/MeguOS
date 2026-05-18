{
  pkgs,
  ...
}:
# Config specific to this user on this host
{
  imports = [
    ./syncthing.nix
    ./niri.nix
  ];

  # Monitor brightness adjustment support
  hardware.i2c.enable = true;

  users.users.megumori = {
    extraGroups = [
      "i2c"
      "openrazer"
    ];
    packages = with pkgs; [
    ];
  };

}
