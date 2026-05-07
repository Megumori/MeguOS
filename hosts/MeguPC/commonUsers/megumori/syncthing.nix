{
  config,
  ...
}:
# MeguPC syncthing config
{
  sops = {
    secrets = {
      stkey = {
        format = "binary";
        sopsFile = ../../../../secrets/megumori/syncthing/MeguPC/key.pem;
      };
      stcert = {
        format = "binary";
        sopsFile = ../../../../secrets/megumori/syncthing/MeguPC/cert.pem;
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
        MeguFW12 = {
          id = "6YL2LUE-7EZDCZD-6YBLUMY-SRLI4TW-XJ6K6GA-57EU6CG-FVHNJPE-OYE54AS";
          name = "MeguFW12";
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
            "MeguFW12"
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
            "MeguFW12"
            "MeguServer"
          ];
        };
      };
    };
  };
}
