{
  description = "MeguFlake";

  nixConfig = {
    extra-substituters = [
       "https://vicinae.cachix.org" #Vicinae
       "https://ezkea.cachix.org"  #aagl
    ];
    extra-trusted-public-keys = [
       "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" 
       "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];

  };

  inputs = {
    # NixOS official package source, using the nixos-25.05 branch here
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
        url = "github:0xc000022070/zen-browser-flake";
        # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
        # to have it up-to-date or simply don't specify the nixpkgs input
        inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
        url = "github:nix-community/nixvim/nixos-25.05";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
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

    nixosConfigurations = {
      
      MeguPC = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            configName = "MeguPC";
          };
          modules = [
            { networking.hostName = "MeguPC"; }
            ./configuration.nix
            ./hosts/MeguPC
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
            ./configuration.nix
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
                ./users/megumori/home
                ];
              };

            }
          ];
      };


    };



  };
}
