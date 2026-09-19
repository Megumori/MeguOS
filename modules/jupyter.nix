{
  pkgs,
  config,
  ...
}:
let
  username = "megumori";
  user = config.users.users.${username};
  pythonEnv = pkgs.python314.withPackages (
    python314Packages: with python314Packages; [
      ipykernel
      numpy
      scipy
      matplotlib
    ]
  );
in
{
  services.jupyter = {
    enable = true;
    package = pkgs.python314Packages.jupyter;
    command = "jupyter-lab";

    kernels = {
      python3 = {
        displayName = "Python3.14 for uni science";
        language = "python";

        argv = [
          "${pythonEnv.interpreter}"
          "-m"
          "ipykernel_launcher"
          "-f"
          "{connection_file}"
        ];
      };
    };

    notebookDir = "${user.home}/sync/uni";
    password = "argon2:$argon2id$v=19$m=10240,t=10,p=8$mb4NcrUZJf7920UZRHXdZQ$cs1p3m9zZL4l3pkyuAw1Id5+9rpf2DzR9yaINQVyGVc";

    port = 8888; # default
    user = username;
    group = "users";
  };
}
