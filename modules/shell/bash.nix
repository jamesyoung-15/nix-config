{ config, pkgs, ... }:

{
  # bash setup
  programs.bash = {
    interactiveShellInit = ''
      if [[ "$TERM" == "xterm-kitty" ]]; then
          alias ssh='kitty +kitten ssh'
      fi
      fastfetch
      eval "$(starship init bash)"
    '';
    shellAliases = {
      yt-dlp-mp3 = "yt-dlp --extract-audio --audio-format mp3 --audio-quality 0";
      la = "ls -aFh";
    };
  };

  environment.systemPackages = with pkgs; [
    starship
    fastfetch
  ];

}
