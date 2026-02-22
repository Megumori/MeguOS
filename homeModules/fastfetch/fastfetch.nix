{
  pkgs, 
  ...
}:
{
  programs.fastfetch =
  {
    enable = true;
    settings =
    {
      logo =
      {
        source = ./meowgayge.png;
        type = "sixel";
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
        }
        {
          type = "kernel";
          key = "{#}{##B57EDC}  Kernel         ";
          format = "{sysname} {release} ({arch})";
        }
        {
          type = "shell";
          key = "{#}{##B57EDC}  Shell          ";
        }
        {
          type = "uptime";
          key = "{#}{##FFFFFF}  Uptime         ";
        }
        {
          type = "command";
          text = "echo $XDG_CURRENT_DESKTOP";
          key = "{#}{##FFFFFF}󰇄  Desktop        ";
        }
        {
          type = "wm";
          key = "{#}{##FFFFFF}  Window Manager ";
          format = "{pretty-name} ({protocol-name})";
        }
        {
          type = "memory";
          key = "{#}{##4A8123}󰍛  Memory         ";
        }
        {
          type = "disk";
          key = "{#}{##4A8123}󱥎  Storage        ";
          format = "{size-used} / {size-total} ({size-percentage})";
        }

      ];
    };
  };
}
