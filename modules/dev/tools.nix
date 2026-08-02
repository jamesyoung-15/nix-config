{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # dev tools
    jupyter
    gh
    awscli2
    google-cloud-sdk
    act # local github actions
    localstack # local aws stack
    pre-commit
    delta
    sops
    gitleaks
    jq
    yq

    # db
    sqlite
  ];
}
