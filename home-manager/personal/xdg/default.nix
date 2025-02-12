{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.config/nix-darwin/dotfiles";
in  {
  xdg.configFile."butler.nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/butler.nvim";
    recursive = true;
  };

  xdg.configFile."tmuxinator" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmuxinator/.tmuxinator";
    target = "../.tmuxinator"; # ~/.config/../.tmuxinator
    recursive = true;
  };
}
