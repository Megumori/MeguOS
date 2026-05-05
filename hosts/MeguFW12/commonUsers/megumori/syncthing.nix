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
        sopsFile = ../../../../secrets/megumori/syncthing/key.pem;
      };
      stcert = {
        format = "binary";
        sopsFile = ../../../../secrets/megumori/syncthing/cert.pem;
      };
    };
  };
  services.syncthing = {
    enable = true;

    settings = {
      key = "${config.sops.secrets.stkey.path}";
      cert = "${config.sops.secrets.stcert.path}";

      devices = {

        MeguPixel = {
          id = "JD7TYAJ-SJSVYHK-VKPLIBZ-RSPUIEU-MMKC4SD-ATKTA7R-2BPZRDH-ZCOYWQ6";
          name = "MeguPixel";
        };
        MeguPC = {
          id = "I4P2RVU-O3Z64HD-LYEVGZK-SVR2G2V-7U7C3L5-VSU4NKB-AL3PHPA-I2PFXQA";
          name = "MeguPC";
        };
        MeguServer = {
          id = "XYJZMSS-6IMTC4J-FGUP3UC-QLURHPU-X727C7A-3RSWOKH-KZSS7CI-FRDKZAD";
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
