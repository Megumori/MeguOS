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
        terminal
        { usernameForTerminal = "megumori"; }
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
      services.gnome.gnome-keyring.enable = true;
      users.users.megumori.packages = [ pkgs.seahorse ];

    };
}
