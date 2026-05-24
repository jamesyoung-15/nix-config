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
      cddev = "cd ~/dev";
      cdprojects = "cd ~/dev/projects";
      cdpractice = "cd ~/dev/practice";
      cdquick = "cd ~/dev/quick";
    };
  };

  programs.home-manager.enable = true;
}
