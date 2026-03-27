{ 
  config, 
  pkgs, 
  ... 
}:
{
  age.secrets = {
    SyncthingKey = {
      file = ../../../../../secrets/syncthing/key.pem.age;
    };
    SyncthingCert = {
      file = ../../../../../secrets/syncthing/cert.pem.age;
    };
  };
  services.syncthing = {
    enable = true;
    key = config.age.secrets.SyncthingKey.path;
    cert = config.age.secrets.SyncthingCert.path;

    settings = {

      devices = {

        MeguPixel = {
          id = "JD7TYAJ-SJSVYHK-VKPLIBZ-RSPUIEU-MMKC4SD-ATKTA7R-2BPZRDH-ZCOYWQ6";
          name = "MeguPixel";
        };
        MeguFW12 = {
          id = "4PICAVK-FTPH5O2-QWUMPW5-IXI6OHG-ENXDD7R-VAHHLLR-QHKHKHP-6HO2DAD";
          name = "MeguFW12";
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
            "MeguFW12"
            "MeguServer"
          ];
        };

        "Twitter" = {
          path = "~/sync/art/twitter";
          devices = [
            "MeguPixel"
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