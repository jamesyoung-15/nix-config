{ config, pkgs, ... }:
{
  # PostgreSQL
  services.postgresql = {
    enable = true;
    ensureDatabases = [ "test-db" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  auth-method
      local all       all     trust
    '';
  };

  # MySQL
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  environment.systemPackages = with pkgs; [ ];
}
