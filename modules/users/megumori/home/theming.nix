{
  self,
  inputs,
  ...
}:
{
  flake.homeModules.megumoriTheming = { pkgs, config, ... }: {
    imports = with self.homeModules; [
      customCursor
    ];
    home.packages = [
      inputs.comic-code-ligatures-nerd-font.packages."${pkgs.stdenv.hostPlatform.system
      }".comic-code-ligatures-nerd-font
    ];
    modules = {
      customCursor = {
        enable = true;
        url = "https://github.com/catppuccin/cursors/releases/download/v2.0.0/catppuccin-mocha-dark-cursors.zip";
        hash = "sha256-EbBzbSBalFx6oo85I7at/wYyoGZuJxIbOWBNrfqHey0=";
        name = "catppuccin-mocha-dark-cursors";
        filetype = "zip";
        size = 24;
      };
    };

    gtk = {
      enable = true;
      colorScheme = "dark";
      font.name = "Comic Code Ligatures Nerd Font";
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.catppuccin-papirus-folders.override {
          flavor = "mocha";
          accent = "lavender";
        };
      };
      theme = {
        name = "catppuccin-mocha-lavender-compact";
        package = pkgs.catppuccin-gtk.override {
          variant = "mocha";
          size = "compact";
          accents = [ "lavender" ];
        };
      };
      gtk4.theme = config.gtk.theme;
    };

    qt = {
      enable = true;
    };

    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };
    };

  };
}
