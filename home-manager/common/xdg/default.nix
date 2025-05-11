{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in  {
  xdg = {
    configFile."aerospace" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/aerospace/.aerospace.toml";
      target = "../.aerospace.toml"; # ~/.config/../.aerospace
    };

    configFile."common-zsh" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/.common.zshrc";
      target = "../.common.zshrc"; # ~/.common.zshrc
    };

    configFile."editorconfig" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/editorconfig/.editorconfig";
      target = "../.editorconfig"; # ~/.config/../.editorconfig
    };

    configFile."hammerspoon" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hammerspoon/.hammerspoon";
      target = "../.hammerspoon"; # ~/.config/../.hammerspoon
    };

    configFile."nvim-unchained" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim-unchained";
    };

    configFile."wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/wezterm";
    };

    # configFile."tmux" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmux/.tmux.conf";
    #   target = "../.tmux.conf"; # ~/.config/../.tmux.conf
    # };

    configFile."git-safe-wrapper" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home-bin/git";
      target = "../bin/git"; # ~/.config/../bin/git
    };

    configFile."git-branch-cleaner" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home-bin/git-branch-cleaner";
      target = "../bin/git-branch-cleaner"; # ~/bin/git-branch-cleaner
    };
  };
}
