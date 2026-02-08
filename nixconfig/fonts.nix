{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
# Fonts for all machines, I'll have a look later at what I want
{
  
  fonts.packages = with pkgs; [
    
    noto-fonts-cjk-sans
    # ipafont
    # dejavu_fonts
    # inputs.comic-code-ligatures-nerd-font.packages."${pkgs.stdenv.hostPlatform.system
    # }".comic-code-ligatures-nerd-font

  ];

}
