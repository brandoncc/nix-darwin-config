{ ... }:

{
  programs.git.signing = {
    key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICc1mtp7I4EyrzuLB+6hiupJL4lgatD7jz+rCKxgTJsy";
    signByDefault = true;
  };
  programs.git.settings = {
    user.name = "Brandon Conway";
    user.email = "brandoncc@gmail.com";

    alias.set-upstream = "!git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD`";
    credential.helper = "osxkeychain";
    gpg.format = "ssh";
    "gpg \"ssh\"".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
    init.defaultBranch = "main";
    mergetool.keepBackup = true;
    pull.rebase = false;
    push.default = "current";
    rebase.updateRefs = true;
    diff = {
      tool = "difftastic";
      external = "difft";
    };
    difftool = {
      difftastic = {
        cmd = ''difft "$MERGED" "$LOCAL" "abcdef1" "100644" "$REMOTE" "abcdef2" "100644"'';
      };
      prompt = false;
    };
    pager = {
      difftool = true;
    };
  };
}
