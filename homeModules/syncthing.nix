{ 
  config, 
  pkgs, 
  ... 
}:
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
        MeguFW12 = {
          id = "4PICAVK-FTPH5O2-QWUMPW5-IXI6OHG-ENXDD7R-VAHHLLR-QHKHKHP-6HO2DAD";
          name = "MeguFW12";
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
            "MeguFW12"
            "MeguPC"
            "MeguServer"
          ];
        };

        "Twitter" = {
          path = "~/sync/art/twitter";
          devices = [
            "MeguPhone"
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