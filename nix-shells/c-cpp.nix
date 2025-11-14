{
  pkgs ? import <nixpkgs> { },
}:

pkgs.stdenv.mkDerivation {
  name = "c-cpp-dev-shell";
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
}
