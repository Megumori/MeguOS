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
    ../../../homeModules/terminal.nix
    # May make this more permanent, we shall see
    ../../../homeModules/fastFetch.nix
  ];

  # Could have home packages down here

}
