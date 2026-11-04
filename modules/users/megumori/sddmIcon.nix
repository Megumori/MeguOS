{
  flake.nixosModules.megumoriSddmIcon =
    { config, ... }:
    {
      modules.sddm.profileIcons = {
        megumori = "${config.assets.megumori.avatar}";
      };
    };

}
