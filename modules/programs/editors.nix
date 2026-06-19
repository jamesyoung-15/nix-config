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

    (vscode.fhsWithPackages (ps: with ps; [
      gnumake
      gcc
      pkg-config
    ]))
  ];
}
