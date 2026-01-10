{ config, pkgs, ... }:

{
  # bash setup
  programs.bash = {
    interactiveShellInit = ''
      neofetch
      eval "$(starship init bash)"
    '';
    shellAliases = {
      yt-dlp-mp3 = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0";
      la = "ls -aFh";
    };
  };

  environment.systemPackages = with pkgs; [
    starship
    neofetch # todo: replace with fastfetch
    fastfetch
  ];

}
