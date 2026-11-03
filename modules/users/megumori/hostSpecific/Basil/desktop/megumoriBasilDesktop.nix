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
      flameshotNiriXdg
    ];
    modules = {
      niri = {
        configPath = ./config.kdl;
      };
    };

    home-manager.users.megumori = {
      imports = with self.homeModules; [
        noctalia
      ];
      modules = {
        noctalia = {
          font = "ComicCodeLigatures Nerd Font";
          settings = {
            notification.monitors = [ "HDMI-A-1" ];
          };
        };
      };
    };
  };
}
