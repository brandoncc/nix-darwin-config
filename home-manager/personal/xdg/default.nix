{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in  {
  xdg.configFile."butler.nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/butler.nvim";
    recursive = true;
  };

  xdg.configFile."personal-zsh" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/.personal.zshrc";
    target = "../.machine_specific.zshrc"; # ~/.machine_specific.zshrc
  };

  xdg.configFile."tmuxinator" = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmuxinator/.tmuxinator";
    target = "../.tmuxinator"; # ~/.config/../.tmuxinator
    recursive = true;
  };
}
