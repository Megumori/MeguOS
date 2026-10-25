{
  flake.nixosModules.fonts = { inputs, pkgs, ... }: {
    fonts.packages = with pkgs; [
      noto-fonts-cjk-sans
      ipafont
      inputs.comic-code-ligatures-nerd-font.packages."${pkgs.stdenv.hostPlatform.system
      }".comic-code-ligatures-nerd-font
      roboto
    ];
  };
}
