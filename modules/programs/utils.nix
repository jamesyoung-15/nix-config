{ config, pkgs, ... }:
{
  services.ratbagd.enable = true;

  environment.systemPackages = with pkgs; [
    # cli tools
    appimage-run
    wl-clipboard-rs
    busybox
    rclone
    nnn
    ydotool
    android-tools

    # benchmarking tools
    speedtest-cli
    rt-tests
    stress-ng
    sysbench
    proton-pass-cli
    # phoronix-test-suite

    # gui tools
    kitty
    wireshark
    kdePackages.kdeconnect-kde
    gnome-disk-utility
    piper
    # bitwarden-desktop # uses eol electron, install from flathub
    keepassxc
    proton-pass
    syncthing
    pkgs.mediawriter
    # pkgs.rpi-imager
    pkgs.krename
    rustdesk
    scrcpy

    # others
    espeak-ng
  ];
}
