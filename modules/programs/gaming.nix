{ config, pkgs, ... }:
{
  # Steam Setup
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  environment.systemPackages = with pkgs; [
    heroic
    lutris
    cemu
    eden
    # retroarch
    runelite

    mangohud
    goverlay
    fusee-nano
    winetricks
    wineWow64Packages.stable
  ];
}
