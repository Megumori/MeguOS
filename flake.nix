{
  description = "MeguFlake";

  

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    vicinae = {
      url = "github:vicinaehq/vicinae";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {

    nixosConfigurations = { # Different host machines listed as follows
      # Remember to change the names accordingly, everywhere it says MeguPC and megumori
      MeguPC = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          configName = "MeguPC";
        };
        modules = [
          { networking.hostName = "MeguPC"; } # Standard set of base config, host config, and user configs
          ./nixconfig
          ./hosts/MeguPC
          ./users/megumori

          home-manager.nixosModules.home-manager 
          {
            home-manager = {        # Same with the home manager modules: host and user
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              users.megumori.imports = [
                ./hosts/MeguPC/home
                ./hosts/MeguPC/home/syncthing.nix # Picked out separately, because it's specific to this combination of host and user. Another user may or may not want it
                ./users/megumori/home
              ];
            };
          }
        ];
      };

      MeguFW12 = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
          configName = "MeguFW12";
        };
        modules = [
          { networking.hostName = "MeguFW12"; }
          ./nixconfig
          ./hosts/MeguFW12
          ./users/megumori

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              users.megumori.imports = [
                ./hosts/MeguFW12/home
                ./hosts/MeguFW12/home/syncthing.nix
                ./users/megumori/home
              ];
            };
          }
        ];
      };

    };


  };
}
