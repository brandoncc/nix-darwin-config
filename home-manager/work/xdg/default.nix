{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in  {
  xdg.configFile.work-claude-commands = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/work/commands";
    target = "../.claude/commands";
  };

  xdg.configFile.work-claude-instructions = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/work/instructions";
    target = "../.claude/instructions";
  };

  xdg.configFile.work-claude-md = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/work/CLAUDE.md";
    target = "../.claude/CLAUDE.md";
  };

  xdg.configFile.work-claude-settings = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/work/settings.json";
    target = "../.claude/settings.json";
  };

  xdg.configFile.work-zsh = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/.work.zshrc";
    target = "../.zshrc";
  };
}
