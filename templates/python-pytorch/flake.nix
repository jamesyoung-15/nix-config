{
  description = "Python + PyTorch (ROCm) development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    { nixpkgs, ... }:
    let
      systems = [ "x86_64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (
        pkgs:
        let
          pythonEnv = pkgs.python314.withPackages (ps: [
            ps.torchWithRocm
            (ps.torchvision.override { torch = ps.torchWithRocm; })
            (ps.torchaudio.override { torch = ps.torchWithRocm; })
            ps.scipy
            ps.pandas
            ps.matplotlib
          ]);
        in
        {
          default = pkgs.mkShell {
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
          };
        }
      );
    };
}
