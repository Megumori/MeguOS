{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops.age = {
    sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
    keyFile = "/var/lib/sops-nix/key.txt";
    generateKey = true;
  };
  environment.systemPackages = [ pkgs.sops ];
  # Note to self on how to use sops:
  # .sops.yaml is the file that manages who has access to what. If you add a new user or host, you may edit permissions there accordingly. Once you've done so, update all the affected files with "sops updatekeys path/to/file"
  # to encrypt a file, the file has to be in the right directory, as sops looks at the .sops.yaml instructions to determine who gets access to that encryption (for some reason it's based off of the source location, not where it ends up)
  # Then encrypt with "sops -e --input-type binary path/to/file > file". Then just move the file back over to where you want it to be. For some reason doing path/to/file > path/to/file fucked it up for me and didn't work
  # For simple variables, you can just do the standard method with the yaml file. You can create and edit the file with "sops path/to/file" and it's just nice n painless.

  # Look at the syncthing.nix in hosts/commonUsers for an example of how it's then used. Though notably if the module option expects a string, you're shit out of luck
  # nixos-rebuild first evaluates stuff, decides what everything should be. And then only later in the build phase does sops-nix decrypt the secrets. So if you put like id=sops.secrets.megupcid, or path, or template stuff
  # nothing will work since the file is still encrypted at that point. Only workaround is to figure out some way to inject the value later on in the build phase, with the help of templates, but for the syncthing config.xml that didn't seem worth the effort

  # And to add a new user / host, easiest to just refer to the github at https://github.com/Mic92/sops-nix, particularly sections 2 and 3

}
