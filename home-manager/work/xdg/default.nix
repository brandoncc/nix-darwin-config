{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in  {
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

  xdg.configFile.work-claude-agents = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/work/agents";
    target = "../.claude/agents";
  };

  xdg.configFile.work-claude-prompts = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/common/prompts";
    target = "../.claude/prompts";
  };

  xdg.configFile.work-claude-rules = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/work/rules";
    target = "../.claude/rules";
  };

  xdg.configFile.work-claude-scripts = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/work/scripts";
    target = "../.claude/scripts";
  };

  xdg.configFile.work-claude-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/work/skills";
    target = "../.claude/skills";
  };

  xdg.configFile.work-zsh = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/.work.zshrc";
    target = "../.zshrc";
  };
}
