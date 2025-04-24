{pkgs, ...}:

{
  home.packages = 
    with pkgs; [
      arduino-cli
      clang-tools
      devenv
      direnv
      discord
      heroku
      ngrok
      tree
    ];
}
