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
          # Synchronise the clipboard with the system clipboard so I can actually copypaste stuff in and out of nvim
          clipboard = "unnamedplus";
          # Make the cursor be centered
          scrolloff = 999;
          # Allow the visual block mode to make blocks anywhere (enter with Ctrl V)
          virtualedit = "block";
          # Show a differential in another window, when doing replacements with :%s
          inccommand = "split";
          # Make looking for and tabbing for functions a lil easier on myself
          ignorecase = true;
        };

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        ui = {
          noice = {
            enable = true;
          };
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        languages = {
          enableTreesitter = true;
          enableFormat = true;
          # enableExtraDiagnostics = true;
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
        };

        tabline = {
          nvimBufferline = {
            enable = true;
            mappings = {
              closeCurrent = "<leader>bq";
            };
          };
        };

        statusline = {
          lualine = {
            enable = true;
          };
        };

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
