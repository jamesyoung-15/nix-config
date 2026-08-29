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
    llama-cpp
    pi-coding-agent

    # other
    gh
    glab
    bruno
    tesseract
    clinfo
    cloudflared
  ];
}
