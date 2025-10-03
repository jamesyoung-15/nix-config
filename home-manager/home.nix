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
    userName = "James Young";
    userEmail = "jyyoung@jyymail.com";
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      cddev = "cd ~/Dev";
      cdprojects = "cd ~/Dev/Projects";
      cdpractice = "cd ~/Dev/Practice";
      cdwork = "cd ~/Work";
      nixpyshell = "nix-shell ~/Nix-Config/nix-shells/python.nix";
      # fix weird issue with nixpkgs python version defaulting to 3.12
      python = "python3.13";
      python3 = "python3.13";
    };
  };

  programs.home-manager.enable = true;
}
