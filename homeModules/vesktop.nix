{
  inputs,
  config,
  pkgs,
  lib,
  ...
}:
{
  programs.vesktop = {
    enable = true;
    settings = {  # Find more at https://github.com/Vencord/Vesktop/blob/main/src/shared/settings.d.ts
      autoStartMinimized = true;
      arRPC = true;
      disableMinSize = true;
      hardwareAcceleration = true;
    };

    vencord.settings.plugins = {    
      petpet.enabled = lib.mkDefault true;
      PictureInPicture.enabled = lib.mkDefault true;
      ShowMeYourName.enabled = lib.mkDefault true;
      UserMessagesPronouns.enabled = lib.mkDefault true;
      NoProfileThemes.enabled = lib.mkDefault true;
      AlwaysExpandRoles.enabled = lib.mkDefault true;
      VolumeBooster = {
        enabled = lib.mkDefault true;
        multiplier = 5;
      };
    };

  };
}
