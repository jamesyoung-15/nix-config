{
  description = "NixOS configuration by James Young";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    # Tracked alongside stable so individual packages can opt in to newer
    # versions via `pkgs.unstable.<name>` (see the overlay below).
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixos-hardware,
      home-manager,
      ...
    }:
    let
      # Makes the whole unstable package set available as `pkgs.unstable.*`
      # in every module, without changing any other package.
      overlay-unstable = final: prev: {
        unstable = import nixpkgs-unstable {
          inherit (prev.stdenv.hostPlatform) system;
          # Keeps per-host settings (allowUnfree, rocmSupport, ...) consistent.
          inherit (prev) config;
        };
      };

      unstableOverlayModule = {
        nixpkgs.overlays = [ overlay-unstable ];
      };
    in
    {
      # Dev shell templates: `nix flake init -t ~/dev/nix-config#python`
      templates = {
        c-cpp = {
          path = ./templates/c-cpp;
          description = "C/C++ dev shell (gcc, clang, cmake, gdb, common libs)";
        };
        java = {
          path = ./templates/java;
          description = "Java dev shell (default JDK, JAVA_HOME set)";
        };
        php = {
          path = ./templates/php;
          description = "PHP dev shell (composer, symfony-cli)";
        };
        playwright = {
          path = ./templates/playwright;
          description = "Python + Playwright dev shell with Nix-provided browsers";
        };
        python = {
          path = ./templates/python;
          description = "Python 3.13 dev shell";
        };
        python-pytorch = {
          path = ./templates/python-pytorch;
          description = "Python 3.12 + PyTorch (ROCm) dev shell";
        };
      };

      nixosConfigurations = {
        main-desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/main-desktop
            unstableOverlayModule

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jamesyoung = ./home-manager/home.nix;

              home-manager.extraSpecialArgs = {
                username = "jamesyoung";
              };
            }
          ];
        };
        framework-13 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/framework-13
            nixos-hardware.nixosModules.framework-13-7040-amd
            unstableOverlayModule

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.jamesyoung = ./home-manager/home.nix;

              home-manager.extraSpecialArgs = {
                username = "jamesyoung";
              };
            }
          ];
        };
      };
    };
}
