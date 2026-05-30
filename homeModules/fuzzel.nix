{
  pkgs,
  ...
}:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.foot}/bin/foot";
        font = "ComicCodeLigatures Nerd Font:size=12";
        placeholder = ":3";
        exit-on-keyboard-focus-loss = "false";
      };
    };
  };
}
