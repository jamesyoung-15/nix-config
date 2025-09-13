{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # modules
    ../../modules/system
    ../../modules/dev
    ../../modules/plasma
    ../../modules/programs
    ../../modules/shell
  ];

  # Framework Laptop configs
  services.fwupd.enable = true; # firmware
  services.power-profiles-daemon.enable = true; # battery, power-profile-daemon recommended for AMD over tlp
  services.fprintd.enable = true; # fingerprint

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "JamesNixFW13"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # enable nix command and flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # framework laptop hidpi screen settings
  services.xserver.dpi = 180;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jamesyoung = {
    isNormalUser = true;
    description = "James Young";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "storage"
      "audio"
      "jackaudio"
      "kvm"
      "dialout"
      "libvirtd"
      "openrazer"
    ];
    packages = with pkgs; [ ];
  };

  # framework 13 specific packages
  environment.systemPackages = with pkgs; [
    polychromatic
  ];

  # open razer
  hardware.openrazer.enable = true;

  # Change default editor from nano to neovim
  environment.variables = {
    # GDK_SCALE=2; # x11 hidpi scaling
    # GDK_DPI_SCALE="0.5"; # x11 text hidpi scaling
    STEAM_FORCE_DESKTOPUI_SCALING = 2; # steam hidpi scaling
  };

  # List services that you want to enable:
  services.flatpak.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
