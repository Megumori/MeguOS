{ 
  config, 
  pkgs, 
  lib,
  inputs,
  ... 
}:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];
  # Add this to flake.nix inputs:
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  
  programs.nixvim = {
    enable = true;

    # Configure neovim options...
    opts = {
      relativenumber = true;
      #incsearch = true;
    };

    # ...mappings...
    # maps.normal = {
    #   "<C-s>" = ":w<CR>";
    #   "<esc>" = { action = ":noh<CR>"; silent = true; };
    # };

    # ... and plugins
    plugins = {
      vim-be-good.enable = true;
    };
  };
}