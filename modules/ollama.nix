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
    loadModels = [
      "deepseek-r1:1.5b"
    ];
  };
  services.open-webui.enable = true;

}
