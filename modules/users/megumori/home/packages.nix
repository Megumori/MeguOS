{
  pkgs,
  self,
  ...
}:
{
  flake.homeModules.megumoriPackages = {
    imports = with self.homeModules; [
      fastfetch
      flameshot
      fuzzel
      terminal
      vesktop
      neovim
      zenBrowser
    ];
  };
}
