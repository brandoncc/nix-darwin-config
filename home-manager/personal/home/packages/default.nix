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
      glab
      graphviz
      hcloud
      heroku
      iina
      ngrok
      nmap
      raycast
      tree
    ];
}
