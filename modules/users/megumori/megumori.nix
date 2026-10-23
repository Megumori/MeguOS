{
  self,
  ...
}:
{
  flake.nixosModules.megumori =
    {
      pkgs,
      ...
    }:
    {
      imports = with self.nixosModules; [
        meguMime
      ];
      users.users.megumori = {
        isNormalUser = true;
        description = "Megu :D";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };
      services.gnome.gnome-keyring.enable = true;
      users.users.megumori.packages = [ pkgs.seahorse ];

    };
}
