{
  flake.nixosModules.megumoriLavenderSyncthing =
    { config, ... }:
    let
      secret = config.sops.secrets;
    in
    {
      services.syncthing = {
        enable = true;
        key = "${secret.megumoriSyncthingLavenderKey.path}";
        cert = "${secret.megumoriSyncthingLavenderCert.path}";

        dataDir = "/home/megumori/sync/";
        user = "megumori";

        settings = {

          devices = {

            MeguPixel = {
              id = "JD7TYAJ-SJSVYHK-VKPLIBZ-RSPUIEU-MMKC4SD-ATKTA7R-2BPZRDH-ZCOYWQ6";
              name = "MeguPixel";
            };
            Basil = {
              id = "TX44G6C-XXDJFMZ-OH5CAZJ-5ZXVH2H-5CLZ5QZ-UQAVXXW-7Q6EAOA-7J6VTA5";
              name = "Basil";
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
                "Basil"
                "MeguServer"
              ];
            };

            "Uni" = {
              path = "~/sync/uni";
              devices = [
                "Basil"
                "MeguServer"
              ];
            };

          };

        };
      };
    };
}
