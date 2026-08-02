{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # languages
    jdk
    rustc
    go
    typescript
    # python
    (python313.withPackages (python-pkgs: [
      python-pkgs.pip
      python-pkgs.ipykernel
      python-pkgs.pytest
      python-pkgs.requests
    ]))
    pylint
    black
    ruff
    uv

    # node
    nodejs
    serve

    # php
    php

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
