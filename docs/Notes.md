# Personal Notes

## Troubleshooting

### Recovering NixOS borked /boot

If the configurations and disk paritions are not deleted and it's just some problem with the `/boot`, mount necessary partitions to `/mnt`, eg:

``` bash
# see which partitions to mount
lsblk
# mount partitions
sudo mount /dev/nvme0n1p2 /mnt
sudo mount /dev/nvme0n1p1 /mnt/boot
# rebuild boot
nixos-enter
nixos-rebuild boot
```

#### What I encountered

So I was trying to dual boot two NixOS both on separate SSDs. For example, let's say:

- Old NixOS -> /dev/nvme0n1
- New NixOS -> /dev/nvme1n1

However, during the GUI installation I accidently pressed `Use Disk` instead of `Erase disk`. 

This ended up overwriting the Old NixOS `/boot` entry, meaning that I could now only boot into the New NixOS and even though in bios I said to use the boot of `/dev/nvme0n1` since the boot entry pointed to the New NixOS it meant that I would always boot into the New NixOS.

I fixed it by deleting the New NixOS partitions, booting to live USB, mounting the Old NixOS SSD, then rebuilding the `/boot` with ` nixos-enter && nixos-rebuild boot `. Then to properly setup the New NixOS I clicked the `Erase disk` this time.

### Python Global System Packages

For some reason, while moving my big `/etc/configuration.nix` to instead use flakes and modularize it with modues, my Python global packages ran into some issues. I had no issues previously, but when modularizing my configuration and using flakes I had this regression.

For example, I would declare global system package:

``` bash
 environment.systemPackages = with pkgs; [
    (python313.withPackages (python-pkgs: [
        python-pkgs.fastapi
    ]))
 ]

```

running `python -c 'import fastapi; print(fastapi.__version__)'` errored out with no module found.

Turns out upon inspection that `python` was using `python 3.12`, whereas I downloaded packages for `python 3.13`, running `python -c 'import fastapi; print(fastapi.__version__)'` fixed the error. 

Not sure why I have this issue, so my fix right now is to just set alias of `python` and `python3` to `python3.13`.
