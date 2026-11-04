{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # embedded
    pkgs.arduino
    pkgs.platformio

    # db
    dbeaver-bin

    # llm tools, track unstable to stay closer to upstream
    pkgs.unstable.opencode
    pkgs.unstable.claude-code
    pkgs.unstable.llama-cpp
    pkgs.unstable.pi-coding-agent

    # other
    gh
    glab
    bruno
    tesseract
    clinfo
    cloudflared
  ];
}
