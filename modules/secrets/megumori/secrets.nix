{
  # Simply define your secrets here, and they'll be accessible from anywhere with config.sops.secrets.name.path :D
  # For more info on the formats etc, refer to https://github.com/Mic92/sops-nix?tab=readme-ov-file#different-file-formats
  flake.nixosModules.megumoriSecrets = {
    sops.secrets = {
      megumoriSyncthingBasilCert = {
        format = "binary";
        sopsFile = ./syncthing/_Basilcert.pem;
      };
      megumoriSyncthingBasilKey = {
        format = "binary";
        sopsFile = ./syncthing/_Basilkey.pem;
      };
      megumoriSyncthingLavenderCert = {
        format = "binary";
        sopsFile = ./syncthing/_Lavendercert.pem;
      };
      megumoriSyncthingLavenderKey = {
        format = "binary";
        sopsFile = ./syncthing/_Lavenderkey.pem;
      };
    };
  };
}
