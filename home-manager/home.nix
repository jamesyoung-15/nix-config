{
  config,
  pkgs,
  username,
  ...
}:

{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };

  home.packages = with pkgs; [
    gh
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "James Young";
      user.email = "jyyoung@jyymail.com";
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      cddev = "cd ~/Dev";
      cdprojects = "cd ~/Dev/Projects";
      cdpractice = "cd ~/Dev/Practice";
      cdwork = "cd ~/Work";
      nixpyshell = "nix-shell ~/Nix-Config/nix-shells/python.nix";
      nixcppshell = "nix-shell ~/Nix-Config/nix-shells/c-cpp.nix";
    };
  };

  programs.home-manager.enable = true;
}
