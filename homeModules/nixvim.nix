{ 
  config, 
  pkgs, 
  ... 
}:
{
  programs.nixvim = {
    enable = true;

    # Configure neovim options...
    options = {
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