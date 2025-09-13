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

    # cursors, icons, etc.
    pkgs.catppuccin-cursors
    pkgs.papirus-icon-theme
    (pkgs.tela-circle-icon-theme.override { colorVariants = ["dracula" "purple"]; })
    pkgs.dracula-icon-theme
    # (pkgs.whitesur-icon-theme.override { themeVariants = ["purple" "nord"];})
    # paper-icon-theme
    pkgs.capitaine-cursors
  ];
}
