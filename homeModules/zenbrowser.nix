{
  inputs,
  ...
}:

{
  # Add this to flake.nix inputs:
  # zen-browser = {
  #   url = "github:0xc000022070/zen-browser-flake";
  #   inputs.nixpkgs.follows = "nixpkgs";
  # };
  imports = [ inputs.zen-browser.homeModules.beta ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    profiles.default = {
      id = 0;
      sine = {
        enable = true;
      };
      search = {
        force = true;
        default = "ddg";
      };
    };

  };
}
