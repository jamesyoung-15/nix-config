{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # embedded
    pkgs.arduino
    pkgs.platformio

    # db
    dbeaver-bin
    mongodb-compass

    # llm tools
    opencode
    # claude-code

    # other
    # bruno # using flatpak until 3.2 is available
    tesseract
    clinfo
  ];
}
