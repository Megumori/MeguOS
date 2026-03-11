{
  pkgs,
  config,
  ...
}:
# Config specific to this user on this host
{
  # Monitor brightness adjustment support
  hardware.i2c.enable = true;
  
  users.users.megumori.extraGroups = [ 
    "i2c" 
    "openrazer"
  ];

  programs.niri.enable = true;


  users.users.megumori.packages = with pkgs; [
    unityhub
  ];


}