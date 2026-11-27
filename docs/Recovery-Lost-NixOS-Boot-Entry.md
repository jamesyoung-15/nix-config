# Recovery: NixOS Missing From Boot Menu After a Crash

Quick-reference runbook. Currently facing weird issue where sometimes machine would crash, drives would disappear in initial reboot, then re-appear but with Linux boot manager gone.

If BIOS shows no drives at all: switch off the PSU for ~2 min, then power on.

## Steps

Boot to a NixOS live USB, open a terminal.

``` bash
# 1. Find the NixOS root (ext4) and ESP (vfat) partitions — nvme numbering can change
lsblk -o NAME,SIZE,FSTYPE,MODEL

# 2. Repair while unmounted
sudo fsck.ext4 -fy /dev/<root>
sudo fsck.vfat -a /dev/<esp>

# 3. Mount and rewrite the bootloader from the already-built system
sudo mount /dev/<root> /mnt
sudo mount /dev/<esp> /mnt/boot
sudo nixos-enter --root /mnt -- /run/current-system/bin/switch-to-configuration boot
# fallback if that fails: sudo bootctl --esp-path=/mnt/boot install

# 4. Reboot
sudo umount -R /mnt
sudo reboot
```

Don't use `nixos-rebuild boot --flake` for this as it tries to rebuild/download everything.
Only the boot partition needs rewriting.

