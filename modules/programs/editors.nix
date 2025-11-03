{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # note taking
    drawio
    rnote
    xournalpp
    anki
    affine

    # office
    libreoffice

    vscode.fhs
  ];
}
