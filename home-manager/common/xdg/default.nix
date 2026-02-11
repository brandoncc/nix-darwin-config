{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in  {
  xdg = {
    configFile."aerospace" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/aerospace/.aerospace.toml";
      target = "../.aerospace.toml"; # ~/.aerospace
    };

    configFile."common-zsh" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/.common.zshrc";
      target = "../.common.zshrc"; # ~/.common.zshrc
    };

    configFile."common-zsh-includes" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/includes";
      target = "zsh/includes";
    };

    configFile."editorconfig" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/editorconfig/.editorconfig";
      target = "../.editorconfig"; # ~/.editorconfig
    };

    configFile."hammerspoon" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hammerspoon/.hammerspoon";
      target = "../.hammerspoon"; # ~/.hammerspoon
    };

    configFile."nvim-unchained" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim-unchained";
    };

    configFile."wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/wezterm";
    };

    configFile."kitty" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/kitty";
    };

    configFile."zellij" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zellij";
    };

    # configFile."tmux" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmux/.tmux.conf";
    #   target = "../.tmux.conf"; # ~/.tmux.conf
    # };

    configFile."git-safe-wrapper" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home-bin/git";
      target = "../bin/git"; # ~/bin/git
    };

    configFile."git-branch-cleaner" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home-bin/git-branch-cleaner";
      target = "../bin/git-branch-cleaner"; # ~/bin/git-branch-cleaner
    };

    configFile."ralph-improve" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home-bin/ralph-improve";
      target = "../bin/ralph-improve"; # ~/bin/ralph-improve
    };

    configFile."ralph-security" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home-bin/ralph-security";
      target = "../bin/ralph-security"; # ~/bin/ralph-security
    };

    configFile."ralph-review" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home-bin/ralph-review";
      target = "../bin/ralph-review"; # ~/bin/ralph-review
    };

    configFile."ralph-interview" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home-bin/ralph-interview";
      target = "../bin/ralph-interview"; # ~/bin/ralph-interview
    };
  };
}
