{
  flake.nixosModules.fonts = { pkgs, ... }: {
    fonts.packages = with pkgs; [
      noto-fonts-cjk-sans
      ipafont
      roboto
    ];
  };
}
