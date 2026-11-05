{
  description = "PHP development shell";

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
          phpEnv = pkgs.php.buildEnv {
            extensions = { enabled, all }: enabled ++ (with all; [ xsl ]);
            extraConfig = "memory_limit=-1";
          };
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              phpEnv
              phpEnv.packages.composer
              symfony-cli
            ];
          };
        }
      );
    };
}
