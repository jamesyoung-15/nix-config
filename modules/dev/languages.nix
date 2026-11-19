{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # languages
    jdk
    rustc
    go
    gopls
    golangci-lint
    delve
    typescript
    # python
    (python313.withPackages (python-pkgs: [
      python-pkgs.pip
      python-pkgs.ipykernel
      python-pkgs.pytest
      python-pkgs.requests
    ]))
    ruff
    pkgs.unstable.uv

    # node
    nodejs
    serve

    # iac
    terraform
    terraform-ls
    opentofu
    tofu-ls
    tflint
    # vault-bin
    # pulumi-bin
    ansible
    ansible-lint

    # others
    nixfmt
    nixfmt-tree
    nix-tree
    texliveFull
    pandoc
    yamlfmt
    yamllint
    prettier
  ];
}
