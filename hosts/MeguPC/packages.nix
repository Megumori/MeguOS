{
  inputs,
  config,
  pkgs,
  ...
}:
#host regular packages
{
  imports = [

  ];

  environment.systemPackages = with pkgs; [
    #Razer shit n camera
    openrazer-daemon
    polychromatic
    cameractrls-gtk4
  ];
}
