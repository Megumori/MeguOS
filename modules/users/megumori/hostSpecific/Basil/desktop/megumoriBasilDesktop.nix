{
  self,
  ...
}:
{
  flake.nixosModules.megumoriBasilDesktop =
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
            font = "ComicCodeLigatures Nerd Font";
            avatarPath = assets.avatar;
            wallpaperDirPath = assets.wallpapers;
            settings = {
              notification.monitors = [ "HDMI-A-1" ];
            };
          };
        };
      };
    };
}
