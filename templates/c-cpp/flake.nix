{
  description = "C/C++ development shell";

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
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            # Compilers and toolchains
            gcc
            clang
            clang-tools # clangd, clang-format, clang-tidy, scan-build, etc.
            lldb
            gdb
            lcov # coverage for gcov

            # Build systems and package managers
            cmake
            ninja
            meson
            pkg-config

            # Static analysis and sanitizers
            cppcheck
            include-what-you-use
            valgrind

            # Project helpers
            ccache
            gnumake
            git

            # Documentation and testing
            doxygen
            graphviz
            gcovr
            catch2
            gtest

            # Misc utilities commonly handy
            ripgrep
            fd
            tree
          ];
          buildInputs = with pkgs; [
            # Libraries
            boost
            elfutils
            ncurses
            openssl
            zlib
            glm
            SDL2
            SDL2_gfx
          ];
        };
      });
    };
}
