{ config, pkgs, ... }:
{
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # file mounting permissions
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # programs.nix-ld.enable = true;

  # force password prompt to be in terminal: https://github.com/NixOS/nixpkgs/issues/24311
  programs.ssh.askPassword = "";

  # System-wide packages
  environment.systemPackages = with pkgs; [
    # essential cli tools
    git
    curl
    wget
    vim
    tlrc
    tmux
    screen
    tree
    direnv
    parallel

    # file utils
    killall
    findutils
    rename
    file
    zip
    p7zip
    unrar
    ffmpeg-full

    # monitoring tools
    htop
    btop
    lm_sensors

    # networking tools
    nmap
    iperf
    iperf2
    dig
    wireguard-tools
    tcpdump

    # others
    picocom
    socat
  ];
}
