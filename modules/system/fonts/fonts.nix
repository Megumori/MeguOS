{
  inputs,
  ...
}:
{
  flake.nixosModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      noto-fonts-cjk-sans
      inputs.comic-code-ligatures-nerd-font.packages."${pkgs.stdenv.hostPlatform.system
      }".comic-code-ligatures-nerd-font
      ipafont
      roboto
    ];
  };
}
