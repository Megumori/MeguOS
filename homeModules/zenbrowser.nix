{
  inputs,
  config,
  pkgs,
  ...
}:

{
  # Add this to flake.nix inputs:
    # zen-browser = {
    #   url = "github:0xc000022070/zen-browser-flake";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  home.packages = with pkgs; [

	  inputs.zen-browser.packages."${system}".default

  ];
}
