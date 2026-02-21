{pkgs, ...}:
{
  programs.fastfetch =
  {
    enable = true;
    settings =
    {
      logo =
      {
        source = ./meowgayge.png;
        type = "chafa";
        padding =
        {
          top = 1;
          left = 2;
        };
        height = 10;
      };
      display = {
        separator = "| ";
      };
      modules =
      [
        "break"
        {
          type = "title";
          format = "{##DD2785}{user-name}{##8869A5}@{##2656B4}{host-name}{#} ~ ";
        }
        {
          type = "os";
          key = "{#}{##B57EDC}  System         ";
          format = "{pretty-name}";
          #keyColor = "#B57EDC";
        }
        {
          type = "kernel";
          key = "{#}{##B57EDC}  Kernel         ";
          format = "{sysname} {release} ({arch})";
          #keyColor = "#B57EDC";
        }
        {
          type = "shell";
          key = "{#}{##B57EDC}  Shell          ";
          #keyColor = "#B57EDC";
        }
        {
          type = "uptime";
          key = "{#}{##FFFFFF}  Uptime         ";
          # keyColor = "#FFFFFF";
        }
        {
          type = "de";
          key = "{#}{##FFFFFF}󰇄  Desktop        ";
          #keyColor = "#FFFFFF";
        }
        {
          type = "wm";
          key = "{#}{##FFFFFF}  Window Manager ";
          format = "{pretty-name} ({protocol-name})";
        }
        {
          type = "memory";
          key = "{#}{##4A8123}󰍛  Memory         ";
          #keyColor = "#FFFFFF";
        }
        {
          type = "disk";
          key = "{#}{##4A8123}󱥎  Storage        ";
          format = "{size-used} / {size-total} ({size-percentage})";
          #keyColor = "#4A8123";
        }
        # {
        #   type = "colors";
        #   key = "{#}{##4A8123}  Colours  ";
        #   #keyColor = "#4A8123";
        #   symbol = "star";
        # }
        

      ];
    };
  };
}
