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
      ffmpeg
      graphviz
      heroku
      iina
      ngrok
      nmap
      raycast
      tree
    ];
}
