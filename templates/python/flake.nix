{
  description = "Python development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (
        pkgs:
        let
          pythonEnv = pkgs.python313.withPackages (ps: [ ]);
        in
        {
          default = pkgs.mkShell {
            packages = [ pythonEnv ];

            # Lets pip/uv-installed wheels find the native libraries they expect
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
