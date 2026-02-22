{pkgs, ...}:
{
  programs.fastfetch =
  {
    enable = true;
    settings =
    {
      logo =
      {
        source = "/home/megumori/Downloads/meowgayge.png"; #Temporary
        #type = "sixel";
        padding =
        {
          top = 1;
          left = 1;
        };
        width = 25;
      };
      modules =
      [
        "break"
        {
          type = "title";
          format = "{user-name}@{host-name} ~ ";
          keyColor = "green";
        }
        {
          type = "os";
          key = " System  ";
          keyColor = "yellow";
        }
        {
          type = "kernel";
          key = " Kernel  ";
          keyColor = "yellow";
        }
        {
          type = "shell";
          key = " Shell   ";
          keyColor = "blue";
        }
        {
          type = "uptime";
          key = " Uptime  ";
          keyColor = "magenta";
        }
        {
          type = "wm";
          key = " Desktop ";
          keyColor = "blue";
        }
        {
          type = "memory";
          key = "󰍛 Memory  ";
          keyColor = "green";
        }
        {
          type = "disk";
          key = "󱥎 Storage ";
          keyColor = "green";
        }
        {
          type = "colors";
          key = " Colours ";
          symbol = "circle";
        }
        

      ];
    };
  };
}
