{...}:

{
  programs.git = {
    enable = true;

    includes= [
      { path = ./includes/config.inc; }
    ];

    hooks = {
      pre-commit = ./hooks/pre-commit;
      pre-push = ./hooks/pre-push;
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
