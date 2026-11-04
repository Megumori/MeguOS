{
  self,
  ...
}:
{
  flake.nixosModules.megumoriLavenderDesktop =
    { config, ... }:
    let
      assets = config.assets.megumori;
    in
    {
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
            avatarPath = assets.avatar;
            wallpaperDirPath = assets.wallpapers;
            font = "ComicCodeLigatures Nerd Font";
          };
        };
      };
    };
}
