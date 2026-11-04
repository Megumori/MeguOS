{
  flake.nixosModules.megumoriBasilSyncthing =
    { config, ... }:
    let
      secret = config.sops.secrets;
    in
    {
      services.syncthing = {
        enable = true;
        key = "${secret.megumoriSyncthingBasilKey.path}";
        cert = "${secret.megumoriSyncthingBasilCert.path}";

        dataDir = "/home/megumori/sync/";
        user = "megumori";

        settings = {

          devices = {
            MeguPixel = {
              id = "JD7TYAJ-SJSVYHK-VKPLIBZ-RSPUIEU-MMKC4SD-ATKTA7R-2BPZRDH-ZCOYWQ6";
              name = "MeguPixel";
            };
            Lavender = {
              id = "6YL2LUE-7EZDCZD-6YBLUMY-SRLI4TW-XJ6K6GA-57EU6CG-FVHNJPE-OYE54AS";
              name = "Lavender";
            };
            MeguServer = {
              id = "W6J5WNN-K5TELIS-CKIU5QZ-O2KD5GU-5CA7PJZ-J5AOH3A-WBPKSPQ-7WY7AQQ";
              name = "MeguServer";
            };
          };

          folders = {
            "Obsidian notes" = {
              path = "~/sync/obsidian";
              devices = [
                "MeguPixel"
                "Lavender"
                "MeguServer"
              ];
            };
            "Twitter" = {
              path = "~/sync/art/twitter";
              devices = [
                "MeguPixel"
                "MeguServer"
              ];
            };
            "Uni" = {
              path = "~/sync/uni";
              devices = [
                "Lavender"
                "MeguServer"
              ];
            };

          };

        };
      };
    };
}
