# General structure:
## flake.nix
Skeleton of the config, practically only ever edit for new inputs, new users or new hosts
## nixConfig
Very basic settings for all machines. Enabling networking, flakes, audio and whatnot.
Make sure to change the system.stateVersion if you're planning on yoinking my config onto a fresh install
## modules
NixOS modules with settings etc that can be imported. Archive folder for stuff I used to use
## homeModules
Home-Manager modules with settings etc that can be imported, same archive folder
## users
List all your users here, or just have 1 like me, nice to keep your options open
### - megumori
Hi, this me. Change this name to your user. Here we do configs that we want our user to have across all machines

Such as:
  Defining the user
  
  Lovely cattpuccin colours
  
  Enabling tailscale
  
  Packages we want everywhere
  
Where we define each of those can be seen by looking at it, modules are imported in packages.nix, tailscale defined in networking etc.
Up to you a little
#### - - home
And in here we do homemanager configs for our user. Set up git, more theming and cattpuccin etc. And again, custom modules imported in packages.nix

Remember to change home.stateVersion if you're yoinking


## hosts
List your different machines here, fine to also just have 1 host, but good to chuck em in their own folder anyhow just in case
### - MeguPC
Change the name accordingly. Chuck your generated hardware configuration here, swap settings, custom filesystems and whatnot.
Just stuff specific to that hardware. In packages for example I have stuff for my mouse etc which is only ever at this host.
#### - - commonUsers
List of common users for a host, say if my PC were used by me and a roommate, while laptop was just me.
This is the home for config specific to a combination of user and host. Say I want retroarch on my PC, but not laptop. I define it for my user in commonUsers
##### - - - megumori
Follows largely the same structure as the global user settings, though largely trimmed down for simplicity's sake. packages.nix etc hasn't been separated, it's all just in default.nix, because there's not much

home folder has Home-Manager configs, such as my retroarch and noctalia. For using noctalia on my laptop, I'd just copy the folder over and make edits as I need (adding battery indicator etc)
