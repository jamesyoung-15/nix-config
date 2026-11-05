{
  description = "Java development shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs =
    { nixpkgs, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      devShells = forAllSystems (
        pkgs:
        let
          # Can replace with any jdk version available in nix packages (jdk17, jdk21, ...)
          jdk = pkgs.jdk;
        in
        {
          default = pkgs.mkShell {
            packages = [ jdk ];
            env.JAVA_HOME = jdk.home;
          };
        }
      );
    };
}
