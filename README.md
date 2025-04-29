# NixOS Config
Heavily WIP; a lot is broken, probably not done the proper way, and wonky.

## Installation

Requires existing NixOS installation with a user account.

Change all username occurances and edit where necessary (marked with `# NOTE: change [...]`).

```bash
git clone https://github.com/Opharg/nixos-config
mv nixos-config $HOME/nix # Config is supposed to be in the ~/nix directory
cd $HOME/nix
sudo nixos-rebuild switch --flake .
home-manager switch --flake .
```

Rebuild NixOS with `rb` and home-manager with `hms`.

## Credit
[mylinuxforwork/dotfiles](https://github.com/mylinuxforwork/dotfiles) and [Andrey0189/nixos-config](https://github.com/Andrey0189/nixos-config) were used as a starting point with lots still remaining.



