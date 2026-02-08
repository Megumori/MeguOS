{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  # Prebuilt cache so I don't have to rebuild each time
  nix.settings = {
    extra-substituters = [
       "https://vicinae.cachix.org"
    ];
    extra-trusted-public-keys = [
       "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc=" 
    ];
  };

  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };
  };

  
} 