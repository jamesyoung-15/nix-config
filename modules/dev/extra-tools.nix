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
    # Build against stable's ROCm so we don't pull a second ~10 GiB ROCm stack
    # from unstable. Only target our GPU (RX 6000 / gfx1030) to keep the local
    # build short — this derivation isn't in the binary cache.
    (pkgs.unstable.llama-cpp.override {
      rocmPackages = pkgs.rocmPackages;
      rocmGpuTargets = [ "gfx1030" ];
    })
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
