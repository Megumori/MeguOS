{
  self,
  ...
}:
{
  flake.nixosModules.megumoriBasilDesktop = {
    imports = with self.nixosModules; [
      # sddm
      # kde
      niri
      { niriConfigPath = ./config.kdl; }
    ];
    home-manager.users.megumori = {
      imports = with self.homeModules; [
        noctalia
      ];
      modules = {
        noctalia = {
          enable = true;
          font = "ComicCodeLigatures Nerd Font";
          settings = {
            notification.monitors = [ "HDMI-A-1" ];
          };
        };
      };
    };
  };
}
