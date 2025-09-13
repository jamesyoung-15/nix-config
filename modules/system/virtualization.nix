{ config, pkgs, ... }:

{
  # enable docker
  virtualisation.docker.enable = true;

  # enable virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  services.spice-vdagentd.enable = true; # enable copy and paste between host and guest
  virtualisation.spiceUSBRedirection.enable = true; # enable usb redirection
  virtualisation.libvirtd.qemu.vhostUserPackages = [ pkgs.virtiofsd ];
}
