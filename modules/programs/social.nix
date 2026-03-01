{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # slack
    discord
    signal-desktop-bin
  ];
}
