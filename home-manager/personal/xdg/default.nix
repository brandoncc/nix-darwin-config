{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in  {
  xdg.configFile.butler-nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/butler.nvim";
    recursive = true;
  };

  xdg.configFile.personal-claude-commands = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/personal/commands";
    target = "../.claude/commands";
  };

  xdg.configFile.personal-claude-instructions = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/personal/instructions";
    target = "../.claude/instructions";
  };

  xdg.configFile.personal-claude-md = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/personal/CLAUDE.md";
    target = "../.claude/CLAUDE.md";
  };

  xdg.configFile.personal-claude-settings = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/personal/settings.json";
    target = "../.claude/settings.json";
  };

  xdg.configFile.personal-zsh = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/.personal.zshrc";
    target = "../.zshrc"; # ~/.zshrc
  };

  xdg.configFile.tmuxinator = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmuxinator/.tmuxinator";
    target = "../.tmuxinator"; # ~/.config/../.tmuxinator
    recursive = true;
  };
}
