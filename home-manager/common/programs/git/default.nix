{...}:

{
  programs.git = {
    enable = true;

    aliases = {
      "bc" = "branch-cleaner"; # This makes 'git bc' call 'git branch-cleaner'
    };

    ignores = [
      "*~"
      "**/.DS_Store"
      "/.idea"
      "/config/application.yml"
      "/.dokkurc"
      "**/*.swo"
      "**/*.swp"
      "/public/uploads"
      "/.env"
      "/.env.*"
      "/server.key"
      "/server.csr"
      "/.bundle"
      "/TAGS"
      "/.tern-port"
      "**/.#*"
      "/config.codekit"
      "/GPATH"
      "/GRTAGS"
      "/GTAGS"
      "/.tags"
      "/config.codekit3"
      "/bs-config.js"
      "/.vscode"
      "/.jshintrc"
      ".dir-locals.el"
      "/.vim/coc-settings.json"
      ".solargraph.yml"
      "**/.nvimlog"
    ];
  };
}
