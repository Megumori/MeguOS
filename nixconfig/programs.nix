{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
# Basic programs for all machines
{
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    inputs.agenix.packages.${system}.default
  ];
}
