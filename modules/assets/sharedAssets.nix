{
  # Mostly a hypothetical module atm, since I don't have anyone I'm sharing this config with as of right now :,D
  # But like the idea is there. Could actually put my like SDDM wallpapers and whatnot in here.
  # Reminder to self to import this somewhere if/when I get around to using this
  flake.nixosModules.sharedAssets = { lib, ... }: {
    options.assets.shared = lib.mkOption {
      type = lib.types.attrsOf lib.types.path;
      description = "Path to whatever you want babyy";
    };
    config.assets.shared = {
    };
  };
}
