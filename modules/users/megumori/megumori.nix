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
        megumoriPackages
        meguMime
        megumoriSddmIcon
      ];
      users.users.megumori = {
        isNormalUser = true;
        description = "Megu colon capital D";
        initialPassword = "salmiakki";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };
      nixpkgs.config.allowUnfree = true;

      services.gnome.gnome-keyring.enable = true;
      users.users.megumori.packages = [ pkgs.seahorse ];

    };
}
