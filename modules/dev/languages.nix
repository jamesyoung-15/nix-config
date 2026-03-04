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
      p.hashicorp_archive
      p.hashicorp_aws
      p.hetznercloud_hcloud
      p.hashicorp_azurerm
      p.hashicorp_google
      p.hashicorp_kubernetes
      p.hashicorp_helm
      p.kreuzwerker_docker
      p.cloudflare_cloudflare
      p.integrations_github
      p.grafana_grafana
      p.telmate_proxmox
      p.hashicorp_random
      p.hashicorp_local
      p.hashicorp_null
      p.hashicorp_time
      p.hashicorp_http
      p.hashicorp_external
      p.hashicorp_vault
      p.hashicorp_tls
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
