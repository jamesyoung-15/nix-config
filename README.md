# James' Nix Config

My Nix config using Nix flakes and home manager. Currently use NixOS on my personal laptop and desktop.

## Setup

Install NixOS, then enable `nix-command` & `flakes` by adding `nix.settings.experimental-features = [ "nix-command" "flakes" ];` to `/etc/nixos/configuration.nix`.

Below shows an example of deploying flake with main desktop host, replace `.#main-desktop` for other machines.

``` bash
sudo nixos-rebuild switch --flake .#main-desktop
```

## Todos

- Add more modular structure
- Improve organization of modules
- Integrate home manager
- MacOS support in case I am forced to use Mac for work in future (?)
