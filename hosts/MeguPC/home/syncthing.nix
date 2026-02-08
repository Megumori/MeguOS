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