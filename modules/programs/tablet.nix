{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # tablet drivers and tools
    pkgs.libwacom
    pkgs.xf86_input_wacom
    pkgs.input-remapper
    pkgs.opentabletdriver
  ];
}
