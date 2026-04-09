{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
  piConfig = "${config.home.homeDirectory}/dev/pi-config";
  piConfigWork = "${config.home.homeDirectory}/dev/pi-config-work";
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

  xdg.configFile.work-claude-statusline = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/common/statusline.sh";
    target = "../.claude/statusline.sh";
  };

  xdg.configFile.work-claude-scripts = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/work/scripts";
    target = "../.claude/scripts";
  };

  xdg.configFile.work-claude-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude/work/skills";
    target = "../.claude/skills";
  };

  xdg.configFile.work-pi-settings = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/settings.json";
    target = "../.pi/agent/settings.json";
  };

  xdg.configFile.work-pi-keybindings = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/keybindings.json";
    target = "../.pi/agent/keybindings.json";
  };

  xdg.configFile.work-pi-agents-md = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/AGENTS.md";
    target = "../.pi/agent/AGENTS.md";
  };

  xdg.configFile.work-pi-agents = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfigWork}/agents";
    target = "../.pi/agent/agents";
  };

  xdg.configFile.work-pi-rules = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/rules";
    target = "../.pi/agent/rules";
  };

  xdg.configFile.work-pi-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfigWork}/skills";
    target = "../.pi/agent/skills";
  };

  xdg.configFile.work-pi-extensions = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfigWork}/extensions";
    target = "../.pi/agent/extensions";
  };

  xdg.configFile.work-pi-data = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/data";
    target = "../.pi/agent/data";
  };

  xdg.configFile.work-pi-user-context = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfigWork}/user-context.md";
    target = "../.pi/agent/user-context.md";
  };

  xdg.configFile.work-agents-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/agents/work/skills";
    target = "../.agents/skills";
  };

  xdg.configFile.work-zsh = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/.work.zshrc";
    target = "../.zshrc";
  };
}
