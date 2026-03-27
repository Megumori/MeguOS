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

    catppuccin = {
      url = "github:catppuccin/nix";
    };

    comic-code-ligatures-nerd-font = {
      url = "github:juliuskreutz/ComicCodeLigaturesNerdFont";
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

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
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
          { networking.hostName = "MeguPC"; } # Standard set of base config, host config, user configs, and combo specifics
          ./nixconfig
          ./hosts/MeguPC
          ./users/megumori
          ./hosts/MeguPC/commonUsers/megumori

          home-manager.nixosModules.home-manager 
          {
            home-manager = {        # For the home manager modules: user and combo specifics
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              users.megumori.imports = [
                ./users/megumori/home
                ./hosts/MeguPC/commonUsers/megumori/home
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
          ./hosts/MeguFW12/commonUsers/megumori

          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs;
              };
              users.megumori.imports = [
                ./users/megumori/home
                ./hosts/MeguFW12/commonUsers/megumori/home
              ];
            };
          }
        ];
      };

    };


  };
}
