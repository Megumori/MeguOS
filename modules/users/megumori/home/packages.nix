{
  pkgs,
  self,
  ...
}:
{
  flake.homeModules.megumoriPackages = {
    imports = with self.homeModules; [
      flameshot
      fuzzel
      terminal
      neovim
      zenBrowser
    ];
  };
}
