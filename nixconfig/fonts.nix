{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

{
  
  fonts.packages = with pkgs; [
    
    noto-fonts-cjk-sans
    # ipafont
    # dejavu_fonts
    # inputs.comic-code-ligatures-nerd-font.packages."${pkgs.stdenv.hostPlatform.system
    # }".comic-code-ligatures-nerd-font

  ];

}
