{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{

  services.ollama = {
    enable = true;
    package = pkgs.ollama;
    models = "~/Models";
  };

}
