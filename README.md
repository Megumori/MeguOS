# Introduction

Hi, this is my nix config, using the dendritic pattern (I think).

Can find more info about it through vimjoyer or Adumh00man, which is where I learned most of this from.

But in short, this is how it works:

## flake.nix

Only thing defined here is the inputs.

Nothing to edit here besides those when importing a new flake.

Important inputs are nixpkgs (duh), flake-parts and import-tree. (home-manager too if using that)

Import-tree does all the importing for everything in modules/

## modules/

This is where everything lives: homeModules, nixosModules, hosts, users etc.

parts.nix imports home-manager as an option and defines what architectures this can be built on.
(Just copied that from vimjoyer :D) 

### homeModules/ and nixosModules/

Fairly self-explanatory. Different folders for home-manager and nixos modules.

Contains mostly different apps, programs, couple fancy features like the customCursor.

Features to be imported elsewhere, to put it briefly.

### system/

Also has nixosModules, but moreso for core-functionality, such as bootloaders or fonts.

Just basic stuff needed for a system. Necessary things are imported into the core module, which is imported in the hosts so that you don't have to import each thing individually.

Others like printing can again be imported as necessary.

### users/

Self-explanatory. However, the structure inside it isn't.
Basically the idea is that each user only needs to edit things inside their own user folder.

(except for secrets, we'll get back to those)

User itself is defined in megumori.nix, alongside the imports of other modules. If you wanted to, you could import everything here,
but to keep it cleaner, you have packages.nix etc.

User packages and nixosModules you want everywhere go in packages.nix (module is named megumoriPackages in this case).

Similarly other configuration you might want like mime or your sddm icon. 

#### home/

Similar structure in the home folder. homeMegumori.nix defines the home-manager user and other configs.

Into that you import packages.nix and theming.nix. These are purely optional to split up, I just like to.

#### hostSpecific/

This is where a user may configure things they only want on some specific hosts.

For example if you wanted steam on your home PC, but not your laptop.

Or here I have my different desktop configurations set in these two.

The reason it's here in the user folder instead of the hosts folder is to stick to that sense of each user configures in their own folder.

Now, you may notice, currently I am the only user here.

You may say this is very pointless.

And you would be correct.

If you don't plan on having more than one user ever, just throw these configs in the host configs and call it a day.

Or don't. At the end of the day, with dendritic nix modules, it doesn't really matter where you put them.

### hosts/

This is where your different machines live.

For example, Basil/Basil.nix defines the host, the nixosConfiguration. Import your modules here.

Generally your modules will be grouped up, such as in the afforementioned core, user or userHostSpecific modules.

Thus this tends to be usually pretty barren.

I have defined some sddm settings in there, since that's strictly host-specific and also not exactly functionally necessary unlike
BasilConfiguration, which defines whatever the host *needs*, as well as imports the generated hardware-configuration.nix.

In theory you could put more config inside of Basil.nix. Or for example you could put anything from users/x/hostSpecific in here and import it.

You do you boo 

### secrets/

Put all yer sops secrets here into user folders. Can then define them in secrets.nix which is imported through the sops module, 
so that you can access them via config.secrets.user.secret, rather than using funky relative paths from everywhere.
(Actually, now thinking about it, ig you could do all the sops encryption here as well. Maybe I'll do that at some point)

## Naming scheme

I try to have all the module names be fairly self-explanatory, even at the cost of brevity.
For example, megumori's desktop config for Lavender, is megumoriLavenderDesktop.
I also try to keep the filenames the same as the module name, mostly, some exceptions I might get around to idk.
There's definitely still some stuff to sort out, like the user home directory names.

Feel free to follow this naming scheme if you wanna yoink my stuff. Or not.


# Honourable mentions and inspirations 

As mentioned before, [vimjoyer](https://www.youtube.com/watch?v=-TRbzkw6Hjs) is who first piqued my interest about dendritic nix and flake parts a while back.

Then the more proper tutorial by [Adumh00man](https://youtu.be/_R1odY2EW_o?si=MGx5U68m0PJ3F_VR) is what got me to actually make this thanks to giving a more hands-on look.


Aside from the dendritic pattern, the overall structure is largely inspired by my friend's config: [communix](https://forge.kruemmelspalter.org/communix/nix/)

This is where I get the idea of structuring it for multiple users, in case somebody wants to join me in this config (surely).

Also a good bunch of my modules, such as noctalia or my terminal, have been pretty much 100% yoinked from there, with maybe minor edits.

And the communix config was in turn inspired by [Julius](https://github.com/juliuskreutz/nix), who also played a part in getting me to start using NixOS.







