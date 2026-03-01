{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # embedded
    pkgs.arduino
    pkgs.platformio

    # db
    dbeaver-bin
    mongodb-compass

    # other
    bruno
    insomnia
    tesseract
    clinfo
  ];
}
