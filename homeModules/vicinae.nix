{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  nix.settings = {
    extra-substituters = [
       "https://vicinae.cachix.org" #Vicinae
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