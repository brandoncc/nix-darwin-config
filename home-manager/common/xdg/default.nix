{ config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/.config/nix-darwin/dotfiles";
in  {
  xdg = {
    configFile."aerospace" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/aerospace/.aerospace.toml";
      target = "../.aerospace.toml"; # ~/.config/../.aerospace
    };

    configFile."editorconfig" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/editorconfig/.editorconfig";
      target = "../.editorconfig"; # ~/.config/../.editorconfig
    };

    configFile."hammerspoon" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hammerspoon/.hammerspoon";
      target = "../.hammerspoon"; # ~/.config/../.hammerspoon
      recursive = true;
    };

    configFile."nvim-unchained" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/nvim-unchained";
      recursive = true;
    };

    configFile."wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/wezterm";
      recursive = true;
    };

    # configFile."tmux" = {
    #   source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmux/.tmux.conf";
    #   target = "../.tmux.conf"; # ~/.config/../.tmux.conf
    #   recursive = true;
    # };
  };
}
