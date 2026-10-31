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
    # These two track nixos-unstable (see the overlay in flake.nix) so they
    # stay close to upstream; everything else here comes from stable.
    pkgs.unstable.claude-code
    pkgs.unstable.llama-cpp
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
