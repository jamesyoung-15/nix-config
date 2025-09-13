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
    obs-studio
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })

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
