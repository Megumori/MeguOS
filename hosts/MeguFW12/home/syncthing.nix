{ 
  config, 
  pkgs, 
  ... 
}:
# FW12 syncthing config
{
  services.syncthing = {
    enable = true;

    settings = {

      devices = {

        MeguPhone = {
          id = "6AZN3QI-QCCK6UJ-5RYHRFP-NNRNET6-CMBFP7U-JU26I6S-XIYT2PA-QVBGYQD";
          name = "MeguPhone";
        };
        MeguPixel = {
          id = "JD7TYAJ-SJSVYHK-VKPLIBZ-RSPUIEU-MMKC4SD-ATKTA7R-2BPZRDH-ZCOYWQ6";
          name = "MeguPixel";
        };
        MeguPC = {
          id = "I4P2RVU-O3Z64HD-LYEVGZK-SVR2G2V-7U7C3L5-VSU4NKB-AL3PHPA-I2PFXQA";
          name = "MeguPC";
        };
        MeguServer = {
          id = "KFIV4K7-ZCCFTYN-YPQQMWU-OEVSOY3-OBA4QSB-CR6WCQF-WDAZTIM-PVS42AZ";
          name = "MeguServer";
        };
      };

      folders = {

        "Obsidian notes" = {
          path = "~/sync/obsidian";
          devices = [
            "MeguPhone"
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