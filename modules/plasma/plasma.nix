{ config, pkgs, ... }:

{
  # setup desktop environment
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
    wayland.enable = true;
  };
  services.displayManager.defaultSession = "plasma"; # plasma for wayland, plasmax11 for x11

  # keyboard
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      kdePackages.fcitx5-qt # fcitx5-gtk
      fcitx5-chinese-addons # table input method support
      fcitx5-nord # a color theme
    ];
  };

  # pipewire audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };
}
