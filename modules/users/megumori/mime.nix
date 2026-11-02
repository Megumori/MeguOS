{
  flake.nixosModules.meguMime =
    let
      browser = "zen-beta.desktop";
      file-browser = "thunar.desktop";
      text-editor = "nvim.desktop";
      image-viewer = "qimgv.desktop";
    in
    {
      xdg = {
        terminal-exec = {
          enable = true;
          settings = {
            default = [ "foot.desktop" ];
          };
        };
        mime = {
          enable = true;
          defaultApplications = {
            # Check https://codeshack.io/mime-type-lookup/
            "inode/directory" = file-browser;
            "image/*" = image-viewer;
            "text/plain" = text-editor;
            "text/html" = browser;
          };
        };
      };
    };
}
