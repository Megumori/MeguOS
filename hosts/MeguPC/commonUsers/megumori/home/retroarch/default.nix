{
  pkgs,
  config,
  ...
}:
let
  # Defines melonDS DS core (messily (ty pegny))
  melonds-ds = pkgs.stdenv.mkDerivation rec {
    pname = "libretro-melonds-ds";
    version = "1.2.0";

    src = pkgs.fetchurl {
      url = "https://github.com/JesseTG/melonds-ds/releases/download/v${version}/melondsds_libretro-linux-x86_64-Release.zip";
      hash = "sha256-m3we8Iqe09GmG+OYHPQDMsiM4/Wcp2M2JicBsn2r2ys="; 
    };

    nativeBuildInputs = [ pkgs.unzip ];
    sourceRoot = "melondsds_libretro-linux-x86_64-Release";

    installPhase = ''
      mkdir -p $out/lib/retroarch/cores
      cp cores/melondsds_libretro.so $out/lib/retroarch/cores
      #cp cores/melondsds_libretro.info $out/lib/retroarch/cores
      
      patchelf --set-rpath "${pkgs.lib.makeLibraryPath [ pkgs.libGL pkgs.stdenv.cc.cc ]}" \
        $out/lib/retroarch/cores/melondsds_libretro.so
    '';

    passthru = {
      libretroCore = "/lib/retroarch/cores";
    };
  };
in
{
  imports = [
    ./controller.nix
  ];
  programs.retroarch = {
    enable = true;

    cores = {
      melondsds = {
        enable = true;
        package = melonds-ds;
      };
    };

    settings = {
      config_save_on_exit = "true";
      input_driver = "wayland";
      input_joypad_driver = "linuxraw";
    };
  };

  home.file."/home/megumori/.config/retroarch/config/remaps/melonDS DS/melonDS DS.rmp" = {
    source = ./FixController.rmp;
    force = true;
  };
}