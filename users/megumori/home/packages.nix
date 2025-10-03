{
    inputs,
    config,
    pkgs,
    ...
}:
#user home packages
{
    imports = [
    ../../../homeModules/zenbrowser.nix
    ../../../homeModules/vscode.nix
    ../../../homeModules/obs.nix
    ../../../homeModules/syncthing.nix
  #  ../../../homeModules/nixvim.nix

    ];

}
