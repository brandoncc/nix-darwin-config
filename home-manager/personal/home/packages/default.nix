{pkgs, ...}:

{
  home.packages =
    with pkgs; [
      arduino-cli
      clang-tools
      devenv
      direnv
      discord
      exercism
      graphviz
      heroku
      ngrok
      tree
    ];
}
