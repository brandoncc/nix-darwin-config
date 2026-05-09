{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
  piConfig = "${config.home.homeDirectory}/dev/pi-config";
  claudeConfig = "${config.home.homeDirectory}/dev/claude-config";
in  {
  xdg.configFile.butler-nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/butler.nvim";
    recursive = true;
  };

  xdg.configFile.personal-claude-dir = {
    source = config.lib.file.mkOutOfStoreSymlink "${claudeConfig}";
    target = "../.claude";
  };

  xdg.configFile.personal-pi-settings = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/settings.json";
    target = "../.pi/agent/settings.json";
  };

  xdg.configFile.personal-pi-keybindings = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/keybindings.json";
    target = "../.pi/agent/keybindings.json";
  };

  xdg.configFile.personal-pi-agents-md = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/AGENTS.md";
    target = "../.pi/agent/AGENTS.md";
  };

  xdg.configFile.personal-pi-agents = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/agents";
    target = "../.pi/agent/agents";
  };

  xdg.configFile.personal-pi-rules = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/rules";
    target = "../.pi/agent/rules";
  };

  xdg.configFile.personal-pi-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/skills";
    target = "../.pi/agent/skills";
  };

  xdg.configFile.personal-pi-extensions = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/extensions";
    target = "../.pi/agent/extensions";
  };

  xdg.configFile.personal-pi-data = {
    source = config.lib.file.mkOutOfStoreSymlink "${piConfig}/data";
    target = "../.pi/agent/data";
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
