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

    framework-tool
    fw-ectool
    maliit-keyboard #keyboard for tablet mode

    ntfs3g
    unityhub

  ];
}
