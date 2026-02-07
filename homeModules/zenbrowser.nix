{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [

  ];

  home.packages = with pkgs; [

	  inputs.zen-browser.packages."${system}".default

  ];
}
