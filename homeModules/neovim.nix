{
  inputs,
  ...
}:
{
  imports = [
    inputs.nvf.homeManagerModules.default
  ];
  # Add this to flake.nix inputs:
  # nvf = {
  #   url = "github:notashelf/nvf";
  #   inputs.nixpkgs.follows = "nixpkgs";
  # };

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        # keymaps = [
        #   {

        #   }
        # ];

        opts = {
          relativenumber = true;
          number = true;
          # When opening new windows, splits down and right
          splitbelow = true;
          splitright = true;
          # Makes text not wrap, instead just extending forever to the side
          wrap = false;
          # Tab config, make tabs into spaces, determine tab length
          expandtab = true;
          tabstop = 2;
          shiftwidth = 2;
          # Make the cursor be centered
          scrolloff = 999;
          # Allow the visual block mode to make blocks anywhere (enter with Ctrl V)
          virtualedit = "block";
          # Show a differential in another window, when doing replacements with :%s
          inccommand = "split";
          # Make looking for and tabbing for functions a lil easier on myself
          ignorecase = true;
        };

        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          # Synchronise the clipboard with the system clipboard so I can actually copypaste stuff in and out of nvim
          registers = "unnamedplus";
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        ui = {
          # Noice moves the command prompt up top to a window when you run commands, maybe some other stuff, idk seems neat
          noice = {
            enable = true;
          };
        };
        # Language server protocol, very neat, helps with all em autofills and checks
        lsp = {
          enable = true;
          formatOnSave = true;
        };

        languages = {
          enableTreesitter = true;
          enableFormat = true;
          enableExtraDiagnostics = true;
          nix = {
            format = {
              type = [ "nixfmt" ];
            };
            enable = true;
            lsp = {
              servers = [ "nixd" ];
            };
          };
          python = {
            enable = true;
          };
        };

        autocomplete = {
          blink-cmp = {
            enable = true;
          };
        };
        # Autofill in the other bracket when doing {} or [] etc.
        autopairs = {
          nvim-autopairs = {
            enable = true;
          };
        };

        comments = {
          comment-nvim = {
            enable = true;
            mappings = {
              toggleSelectedLine = "<leader>cb";
              toggleCurrentLine = "<leader>cl";
            };
          };
        };
        diagnostics = {
          enable = true;
          config = {
            # Make the error messages show up in virtual lines to show clearly where and what I fucked up
            virtual_lines = true;
          };
        };

        git = {
          enable = true;
          git-conflict = {
            mappings = {
              both = null; # Stop conflicting with comment
            };
          };
          neogit = {
            enable = true;
          };
        };
        # Top bar with all them tabs
        tabline = {
          nvimBufferline = {
            enable = true;
            mappings = {
              closeCurrent = "<leader>bq";
            };
          };
        };
        # Bottom bar with all them cool info
        statusline = {
          lualine = {
            enable = true;
          };
        };
        # Shows the filetree of the directory you opened nvim from, with :Neotree
        filetree = {
          neo-tree = {
            enable = true;
            setupOpts = {
              # Make hidden .files visible
              filesystem = {
                filtered_items = {
                  visible = true;
                };
              };
            };
          };
        };

      };
    };
  };
}
