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

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "JamesNixMainDesktop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # automount disks
  fileSystems."/home/jamesyoung/Extra-Storage-01" = {
    device = "/dev/disk/by-label/JamesStorage";
    fsType = "ext4";
    options = [ "nofail" ];
  };

  # disable wakeup trigger for amd usb controller
  services.udev.extraRules = ''
    ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x15b6" ATTR{power/wakeup}="disabled"
    ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x15b7" ATTR{power/wakeup}="disabled"
    ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x15b8" ATTR{power/wakeup}="disabled"
  '';

  # remove  x11 ssh ask pass gui thing: https://github.com/NixOS/nixpkgs/issues/24311
  programs.ssh.askPassword = "";

  # List services that you want to enable:
  services.flatpak.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # enable bluetooth
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot
  # services.blueman.enable = true; # only needed for WM or DE without bluetooth manager

  # AMD GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ 
      rocmPackages.clr.icd # rocm opencl driver
      clinfo # opencl info tool
    ];
  };

  # Enable OpenGL support
  hardware.opengl.enable = true;

  # create a linked path for rocm libraries that might be hardcoded
  # systemd.tmpfiles.rules = 
  # let
  #   rocmEnv = pkgs.symlinkJoin {
  #     name = "rocm-combined";
  #     paths = with pkgs.rocmPackages; [
  #       rocblas
  #       hipblas
  #       clr
  #     ];
  #   };
  # in [
  #   "L+    /opt/rocm   -    -    -     -    ${rocmEnv}"
  # ];


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
