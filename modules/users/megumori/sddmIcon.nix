{
  flake.nixosModules.megumoriSddmIcon =
    { pkgs, ... }:
    {
      modules.sddm.profileIcons = {
        megumori = pkgs.fetchurl {
          url = "https://meowgayge.org/gayge2k.png";
          hash = "sha256-Bj02cRilp2g2RBbpDwY5e+gMRoPf91G68+4Fxf6Ug5U=";
          name = "gagye.png";
        };
      };
    };

}
