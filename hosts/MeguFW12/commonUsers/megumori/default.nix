{
  pkgs,
  config,
  ...
}:
# Config specific to this user on this host
{
  users.users.megumori.packages = with pkgs; [
    
  ];
}