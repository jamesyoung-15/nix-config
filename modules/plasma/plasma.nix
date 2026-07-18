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
      kdePackages.fcitx5-chinese-addons # table input method support
      fcitx5-nord # a color theme
    ];
  };

  # pipewire audio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    jack.enable = true;


    # AirPlay/RAOP config
    raopOpenFirewall = true; # opens UDP ports 6001-6002
    extraConfig.pipewire = {
      "10-airplay" = {
        "context.modules" = [
          {
            name = "libpipewire-module-raop-discover";

            # increase the buffer size if you get dropouts/glitches
            # args = {
            #   "raop.latency.ms" = 500;
            # };
          }
        ];
      };
    };
  };

  # needed for airplay/raop service discovery
  services.avahi.enable = true;
}
