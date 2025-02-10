{pkgs, ...}:

{
  home.packages = 
    with pkgs; [
      clang-tools
      devenv
      direnv
      discord
      heroku
      ngrok
      tree
    ];
}
