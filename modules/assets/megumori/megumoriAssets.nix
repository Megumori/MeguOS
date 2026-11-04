{
  # Imported in megumori.nix so that I have my assets with me wherever I go :D
  flake.nixosModules.megumoriAssets = { lib, ... }: {
    options.assets.megumori = lib.mkOption {
      type = lib.types.attrsOf lib.types.path;
      description = "Path to whatever you want babyy";
    };
    config.assets.megumori = {
      wallpapers = ./wallpapers;
      avatar = ./face.png;
    };
  };
}
