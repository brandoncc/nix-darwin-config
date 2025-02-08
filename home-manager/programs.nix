{
  autojump = ./home/programs/autojump;

  # Let Home Manager install and manage itself.
  home-manager.enable = true;


  neovim = {
    enable = true;
    package = neovimNightlyPackage;
  };

  git = {
    enable = true;

    userName = "Brandon Conway";
    userEmail = "brandoncc@gmail.com";
  };
}
