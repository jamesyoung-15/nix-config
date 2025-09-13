{ config, pkgs, ... }:
{
  # for mouse decoration on firefox/librewolf: https://discourse.nixos.org/t/firefox-does-not-use-kde-window-decorations-and-cursor/32132
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    firefox-bin
    librewolf
    ungoogled-chromium
  ];
}
