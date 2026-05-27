{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # embedded
    pkgs.arduino
    pkgs.platformio

    # db
    dbeaver-bin

    # llm tools
    opencode
    claude-code

    # other
    # bruno # using flatpak until 3.2 is available
    tesseract
    clinfo
    cloudflared
  ];
}
