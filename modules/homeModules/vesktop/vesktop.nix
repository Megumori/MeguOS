{
  flake.homeModules.vesktop = {
    programs.vesktop = {
      enable = true;
      settings = {
        # Find more at https://github.com/Vencord/Vesktop/blob/main/src/shared/settings.d.ts
        autoStartMinimized = true;
        disableMinSize = true;
        tray = false;
        hardwareAcceleration = true;
      };

      vencord.settings.plugins = {
        petpet.enabled = true;
        PictureInPicture.enabled = true;
        ShowMeYourName.enabled = true;
        UserMessagesPronouns.enabled = true;
        NoProfileThemes.enabled = true;
        AlwaysExpandRoles.enabled = true;
        VolumeBooster = {
          enabled = true;
          multiplier = 5;
        };
      };
    };
  };
}
