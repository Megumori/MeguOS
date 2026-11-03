{
  self,
  ...
}:
{
  flake.nixosModules.megumoriLavenderDesktop = {
    imports = with self.nixosModules; [
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
        };
      };
    };
  };
}
