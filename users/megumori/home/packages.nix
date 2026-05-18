{
  pkgs,
  ...
}:
#user home packages
{
  imports = [
    # Custom modules
    ../../../homeModules/zenbrowser.nix
    ../../../homeModules/vscode.nix
    ../../../homeModules/obs.nix
    ../../../homeModules/neovim.nix
    ../../../homeModules/vicinae.nix
    ../../../homeModules/vesktop.nix
    ../../../homeModules/terminal.nix
    ../../../homeModules/fastfetch
    # ../../../homeModules/lutris.nix
    ../../../homeModules/flameshot.nix
  ];

  # Could have home packages down here
  home.packages = with pkgs; [
    cinny-desktop
    inkscape
    localsend # Open firewall port 53317
  ];
}
