{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # dev tools
    jupyter
    hugo
    gh
    awscli2
    google-cloud-sdk
    act # local github actions
    localstack # local aws stack
    ollama

    # db
    sqlite
  ];
}
