{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Media players
    vlc
    mpv
    clementine
    libvlc

    # media editors
    tenacity
    gimp-with-plugins
    blender
    libresprite
    kdePackages.kdenlive
    glaxnimate

    # recording software
    obs-studio
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
    snapshot

    # media tools
    feh
    gif-for-cli
    imagemagick
    playerctl
    yt-dlp
    mediainfo

    # ebook
    calibre
  ];
}
