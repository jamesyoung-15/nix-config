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
    nodePackages_latest.nodejs
    nodePackages.serve

    # php
    php

    # iac
    terraform
    terraform-ls
    vault-bin
    pulumi-bin
    opentofu
    ansible
    ansible-lint

    # others
    nixfmt-rfc-style
    nixfmt-tree
    nix-tree
    texliveFull
    pandoc
    yamlfmt
    prettier
  ];
}
