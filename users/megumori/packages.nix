{
  pkgs,
  ...
}:
#user nix packages
{
  imports = [
    # custom modules
    ../../modules/openssh.nix

    ../../modules/steam.nix
    ../../modules/sunshine.nix
    ../../modules/thunar.nix
  ];

  # Remember to change name
  users.users.megumori.packages = with pkgs; [

  ];
}
