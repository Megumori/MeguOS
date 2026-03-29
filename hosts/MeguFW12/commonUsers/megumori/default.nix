{
  pkgs,
  config,
  ...
}:
# Config specific to this user on this host
{
  imports = [

  ];

  users.users.megumori.packages = with pkgs; [
    
  ];
}