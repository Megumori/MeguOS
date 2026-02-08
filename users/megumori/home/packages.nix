{
  inputs,
  config,
  pkgs,
  ...
}:
#user home packages
{
  imports = [ # Custom modules
  	../../../homeModules/zenbrowser.nix
  	../../../homeModules/vscode.nix
  	../../../homeModules/obs.nix
    ../../../homeModules/nixvim.nix
    ../../../homeModules/vicinae.nix
    ../../../homeModules/vesktop.nix
  ];

  # Could have home packages down here

}
