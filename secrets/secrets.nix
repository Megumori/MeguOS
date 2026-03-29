let
  megumoriPC = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK49+/ydcGoZLq+EiWS4xoCiBphAyLL9bfvTN9iLnZ7+";
  megumoriFW12 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICP8IfIrstLFPER4YVwCg1aTXTRZ/FhXJ+/mbWdKpoI4";
  users = [ 
    megumoriPC
    megumoriFW12
  ];
  megumori = [
    megumoriPC
    megumoriFW12
  ];


  MeguPC = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJZe2gvxMMBHVdUrszMe+wtEaazjq9+XicnzF+g82T2G";
  hosts = [ MeguPC ];
in
{

  # Syncthing keys setup (mainly for trying out agenix)
  "syncthing/key.pem.age".publicKeys = megumori;
  "syncthing/cert.pem.age".publicKeys = megumori;

}