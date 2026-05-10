{pkgs, ...}:

{
  home.packages =
    with pkgs; [
      arduino-cli
      clang-tools
      # GNU coreutils, `g`-prefixed (gtimeout, ghead, gls, ...) so it doesn't
      # shadow the BSD versions macOS ships. Provides utilities that aren't on
      # macOS by default — most notably `timeout` — and GNU flag variants for
      # scripts written against the GNU forms.
      coreutils-prefixed
      devenv
      direnv
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
      sqlcipher
      tree
      tree-sitter
    ];
}
