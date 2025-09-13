with import <nixpkgs> { };
mkShell {
  # Can replace with any jdk version available in nix packages
  buildInputs = [ pkgs.jdk ];
  shellHook = ''
    export JAVA_HOME=${pkgs.jdk}
    PATH="${pkgs.jdk}/bin:$PATH"
  '';
}
