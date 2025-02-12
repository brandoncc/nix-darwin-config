{ config, ... }:

{
  programs.git.userName = "Brandon Conway";
  programs.git.userEmail = "brandon.conway@shopify.com";
  programs.git.includes = [
    { path = "${config.home.homeDirectory}/.config/dev/gitconfig"; }
  ];

  programs.git.extraConfig = {
    core.editor = "nvim";

    "filter \"lfs\"" = {
      clean = "git-lfs clean -- %f";
      smudge = "git-lfs smudge -- %f";
      process = "git-lfs filter-process";
      required = true;
    };

    push.autoSetupRemote = true;
    rebase.updateRefs = true;

    init.defaultBranch = "main";
  };
}
