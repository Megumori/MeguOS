{
  config,
  ...
}:
# FW12 syncthing config
{
  sops = {
    secrets = {
      stkey = {
        format = "binary";
        sopsFile = ../../../../secrets/megumori/syncthing/MeguFW12/key.pem;
      };
      stcert = {
        format = "binary";
        sopsFile = ../../../../secrets/megumori/syncthing/MeguFW12/cert.pem;
      };
    };
  };
  services.syncthing = {
    enable = true;
    key = "${config.sops.secrets.stkey.path}";
    cert = "${config.sops.secrets.stcert.path}";

    dataDir = "/home/megumori/sync/";
    user = "megumori";

    settings = {

      devices = {

        MeguPixel = {
          id = "JD7TYAJ-SJSVYHK-VKPLIBZ-RSPUIEU-MMKC4SD-ATKTA7R-2BPZRDH-ZCOYWQ6";
          name = "MeguPixel";
        };
        MeguPC = {
          id = "TX44G6C-XXDJFMZ-OH5CAZJ-5ZXVH2H-5CLZ5QZ-UQAVXXW-7Q6EAOA-7J6VTA5";
          name = "MeguPC";
        };
        MeguServer = {
          id = "W6J5WNN-K5TELIS-CKIU5QZ-Q2KD5GU-5CA7PJZ-J5AOH3A-WBPKSPQ-7WY7AQQ";
          name = "MeguServer";
        };
      };

      folders = {

        "Obsidian notes" = {
          path = "~/sync/obsidian";
          devices = [
            "MeguPixel"
            "MeguPC"
            "MeguServer"
          ];
        };

        "Uni" = {
          path = "~/sync/uni";
          devices = [
            "MeguPC"
            "MeguServer"
          ];
        };

      };

    };

  };

}
