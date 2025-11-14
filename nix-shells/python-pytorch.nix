{
  pkgs ? import <nixpkgs> { },
}:

let
  pythonEnv = pkgs.python312.withPackages (ps: [
    ps.torchWithRocm
    (ps.torchvision.override { torch = ps.torchWithRocm; })
    (ps.torchaudio.override { torch = ps.torchWithRocm; })
    ps.scipy
    ps.pandas
    ps.matplotlib
  ]);

in
pkgs.mkShell {
  packages = [
    pythonEnv
    pkgs.rocmPackages.clr
  ];

  env.LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.libz
    pkgs.stdenv.cc.cc.lib
    pkgs.libGL
    pkgs.glib
    pkgs.libglvnd
  ];
}
