{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # gtk and qt themes
    (pkgs.catppuccin-kde.override {
      accents = [ "lavender" ];
      flavour = [ "mocha" ];
      winDecStyles = [ "modern" ];
    })
    (pkgs.catppuccin-gtk.override {
      accents = [ "lavender" ];
      variant = "mocha";
      size = "standard";
    })
    pkgs.catppuccin-kvantum
    pkgs.dracula-theme
    pkgs.lightly-qt
    kdePackages.sddm-kcm # sddm theme
  ];
}
