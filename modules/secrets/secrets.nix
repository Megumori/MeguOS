{
  flake.nixosModules.secrets = { lib, ... }: {
    options.secrets = {
      megumori = lib.mkOption {
        type = lib.types.attrsOf lib.types.path;
        default = { };
      };
      #     otheruser = lib.mkOption {
      #       type = lib.types.attrsOf lib.types.path;
      #       default = { };
      #     };

    };
    config.secrets = {
      megumori = {
        SyncthingBasilCert = ./megumori/syncthing/_Basilcert.pem;
        SyncthingBasilKey = ./megumori/syncthing/_Basilkey.pem;
        SyncthingLavenderCert = ./megumori/syncthing/_Lavendercert.pem;
        SyncthingLavenderKey = ./megumori/syncthing/_Lavenderkey.pem;
      };
    };
  };
}
