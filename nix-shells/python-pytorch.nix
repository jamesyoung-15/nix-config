{
  pkgs ? import <nixpkgs> { },
}:

let
  pythonEnv = pkgs.python312.withPackages (ps: [ 
    ps.torch
  ]);

in
pkgs.mkShell {
  packages = [
    pythonEnv
  ];

  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.libz
    pkgs.stdenv.cc.cc.lib
    pkgs.libGL
    pkgs.glib
    pkgs.libglvnd
  ];
}
