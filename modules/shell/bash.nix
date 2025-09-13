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
    };
  };

  environment.systemPackages = with pkgs; [
    starship
    neofetch
  ];

}
