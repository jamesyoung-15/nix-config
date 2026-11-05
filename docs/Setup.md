# Setup Instructions

Install NixOS, then enable `nix-command` & `flakes` by adding `nix.settings.experimental-features = [ "nix-command" "flakes" ];` to `/etc/nixos/configuration.nix` and run `sudo nixos-rebuild switch`.

Remember if changing hardware (eg. changing SSD) of a machine rebuild the `hardware-configurations.nix`, then replace it in `hosts`.

Below shows an example of deploying flake with main desktop host, replace `.#main-desktop` for other machines listed in hosts.

``` bash
sudo nixos-rebuild switch --flake .#main-desktop
```

## Update packages

Update the `flake.lock`, then rebuild, ie:

```bash
nix flake update
sudo nixos-rebuild switch --flake .#replaceme
```

### Upgrade NixOS version

1. Update `flake.nix` inputs to desired channel, eg:

  ```nix
  nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  ```

2. Update `flake.lock` and rebuild, eg:

  ```bash
  nix flake update
  sudo nixos-rebuild switch --flake .#replaceme
  ```

3. (Optional) Update channels

  ```bash
  sudo nix-channel --list
  sudo --add https://nixos.org/channels/<channel-name> nixos
  ```

## Other Setup

I have some `scripts` for setting up things that I am too lazy or can't use Nix to setup, remember to `chmod +x` the scripts.

``` bash
# setup and install flatpaks
./scripts/flatpak-setup.sh

# if backing up list of installed flatpaks
./scripts/flatpak-export.sh

# install VSCode extensions
./scripts/install-vscode-extensions.sh

# copy relevant configs to .config
./local-config-setup.sh
```

I know ideally for local configs I should be using home manager to declare the configs like installed VSCode extensions and what not, but I'm too lazy and will leave it for another day.
