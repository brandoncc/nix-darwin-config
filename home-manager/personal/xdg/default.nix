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

  xdg.configFile.personal-claude-prompts = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/common/prompts";
    target = "../.claude/prompts";
  };

  xdg.configFile.personal-claude-rules = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/personal/rules";
    target = "../.claude/rules";
  };

  xdg.configFile.personal-claude-settings = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/personal/settings.json";
    target = "../.claude/settings.json";
  };

  xdg.configFile.personal-claude-statusline = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/common/statusline.sh";
    target = "../.claude/statusline.sh";
  };

  xdg.configFile.personal-claude-agents = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/personal/agents";
    target = "../.claude/agents";
  };

  xdg.configFile.personal-claude-scripts = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/personal/scripts";
    target = "../.claude/scripts";
  };

  xdg.configFile.personal-claude-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/personal/skills";
    target = "../.claude/skills";
  };

  xdg.configFile.personal-pi-settings = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/pi/personal/settings.json";
    target = "../.pi/agent/settings.json";
  };

  xdg.configFile.personal-pi-keybindings = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/pi/personal/keybindings.json";
    target = "../.pi/agent/keybindings.json";
  };

  xdg.configFile.personal-pi-agents-md = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/pi/personal/AGENTS.md";
    target = "../.pi/agent/AGENTS.md";
  };

  xdg.configFile.personal-pi-rules = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/pi/personal/rules";
    target = "../.pi/agent/rules";
  };

  xdg.configFile.personal-pi-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/pi/personal/skills";
    target = "../.pi/agent/skills";
  };

  xdg.configFile.personal-pi-extensions = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/pi/personal/extensions";
    target = "../.pi/agent/extensions";
  };

  xdg.configFile.personal-pi-data = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/pi/personal/data";
    target = "../.pi/agent/data";
  };

  xdg.configFile.personal-pi-user-context = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/pi/personal/user-context.md";
    target = "../.pi/agent/user-context.md";
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
