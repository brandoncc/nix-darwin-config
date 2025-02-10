{ ... }:

{
  programs.git.userName = "Brandon Conway";
  programs.git.userEmail = "brandoncc@gmail.com";
  programs.git.signing = {
    key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICc1mtp7I4EyrzuLB+6hiupJL4lgatD7jz+rCKxgTJsy";
    signByDefault = true;
  };
  programs.git.extraConfig = {
    alias.set-upstream = "!git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`";
    credential.helper = "osxkeychain";
    gpg.format = "ssh";
    "gpg \"ssh\"".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    init.defaultBranch = "main";
    mergetool.keepBackup = true;
    pull.rebase = false;
    push.default = "current";
    rebase.updateRefs = true;
  };

  programs.git.ignores = [
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
}
