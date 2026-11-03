{
  flake.nixosModules.jupyter =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    let
      cfg = config.modules.jupyter;
    in
    {
      options.modules.jupyter = {
        notebookDir = lib.mkOption {
          type = lib.types.str;
          description = "Where to store jupyter notebooks";
          default = "/home/megumori/sync/uni";
        };
        password = lib.mkOption {
          type = lib.types.str;
          description = "Password to use with notebook. Can be generated following: https://jupyter-server.readthedocs.io/en/stable/operators/public-server.html#preparing-a-hashed-password";
          default = "argon2:$argon2id$v=19$m=10240,t=10,p=8$mb4NcrUZJf7920UZRHXdZQ$cs1p3m9zZL4l3pkyuAw1Id5+9rpf2DzR9yaINQVyGVc";
        };
        user = lib.mkOption {
          type = lib.types.str;
          description = "What user to run jupyter as. (Probably set your own if notebookDir is in your home dir)";
          default = "megumori";
        };
        group = lib.mkOption {
          type = lib.types.str;
          description = "What group to run jupyter as. (Probably set to users if notebookDir is in your home dir)";
          default = "users";
        };
        port = lib.mkOption {
          type = lib.types.int;
          description = "What port to run on";
          default = 8888;
        };
        pythonEnvironment = lib.mkOption {
          type = lib.types.package;
          description = "What libraries to include in python. If you want further configs than this, do it yourself :3";
          default = pkgs.python3.withPackages (
            pythonPackages: with pythonPackages; [
              ipykernel
              numpy
              scipy
              sympy
              matplotlib
            ]
          );

        };
      };
      config = {
        services.jupyter = {
          inherit (cfg)
            password
            notebookDir
            user
            group
            port
            ;
          enable = true;
          package = pkgs.python314Packages.jupyter;
          command = "jupyter-lab";

          kernels = {
            python3 = {
              displayName = "Python";
              language = "python";

              argv = [
                "${cfg.pythonEnvironment.interpreter}"
                "-m"
                "ipykernel_launcher"
                "-f"
                "{connection_file}"
              ];
            };
          };

        };

      };
    };
}
