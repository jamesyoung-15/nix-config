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

      # data/ml
      python-pkgs.scipy
      python-pkgs.seaborn
      python-pkgs.numpy
      python-pkgs.pandas
      python-pkgs.matplotlib
      python-pkgs.scikit-learn

      # computer vision
      python-pkgs.pillow

      # dev
      python-pkgs.flask
      # python-pkgs.fastapi
      python-pkgs.pytest

      # networking
      python-pkgs.requests
      python-pkgs.dnspython
    ]))
    python312Packages.fastapi
    poetry
    pylint
    black
    uv

    # node
    nodePackages_latest.nodejs
    nodePackages.serve

    # php
    php

    # iac
    (pkgs.terraform.withPlugins (p: [
      p.archive
      p.aws
      p.hcloud
      p.azurerm
      p.google
      p.kubernetes
      p.helm
      p.docker
      p.cloudflare
      p.github
      p.grafana
      p.proxmox
      p.random
      p.local
      p.null
      p.time
      p.http
      p.external
      p.vault
      p.tls
    ]))
    terraform-ls
    vault-bin
    pulumi-bin
    opentofu

    # others
    nixfmt-rfc-style
    nixfmt-tree
    nix-tree
    texliveFull
    pandoc
  ];
}
