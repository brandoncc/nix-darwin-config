{ config, ... }:

{
  programs.git.includes = [
    { path = "${config.home.homeDirectory}/.config/dev/gitconfig"; }
  ];

  programs.git.settings = {
    user.name = "Brandon Conway";
    user.email = "brandon.conway@shopify.com";

    core = {
      editor = "nvim";
      fsmonitor = false;
    };

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
