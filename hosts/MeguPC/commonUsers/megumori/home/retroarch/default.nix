{
  pkgs,
  config,
  ...
}:
{
  imports = [
    ./controller.nix
  ];
  programs.retroarch = {
    enable = true;

    cores = {
      desmume.enable = true;
    };

    settings = {
      config_save_on_exit = "false";
      input_driver = "wayland";
      input_joypad_driver = "linuxraw";
    };
  };

  home.file."/home/megumori/.config/retroarch/config/remaps/DeSmuME/DeSmuME.rmp" = {
    source = ./FixController.rmp;
    force = true;
  };
}