{ config, ... }:

let
  dotfiles    = "${config.home.homeDirectory}/.dotfiles";
  agentMerged = "${config.home.homeDirectory}/.local/share/agent-config/merged";
in {
  # ----- non-agent xdg entries (preserved) -----

  xdg.configFile.butler-nvim = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/butler.nvim";
    recursive = true;
  };

  xdg.configFile.personal-zsh = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/.personal.zshrc";
    target = "../.zshrc";
  };

  xdg.configFile.tmuxinator = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/tmuxinator/.tmuxinator";
    target = "../.tmuxinator";
    recursive = true;
  };

  xdg.configFile.prune-knowledge = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home-bin/prune-knowledge";
    target = "../bin/prune-knowledge";
  };

  xdg.configFile.claude-pr-joust = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/claude-pr-joust/config.json";
    target = "claude-pr-joust/config.json";
  };

  # JS package-manager supply-chain hardening — files live in
  # ~/.dotfiles/{npm,yarn,bun}/ and are linked here writeable so per-project
  # `npm config set` etc. still work.
  xdg.configFile.npmrc = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/npm/.npmrc";
    target = "../.npmrc";
  };
  xdg.configFile.yarnrc = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/yarn/.yarnrc.yml";
    target = "../.yarnrc.yml";
  };
  xdg.configFile.bunfig = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/bun/.bunfig.toml";
    target = "../.bunfig.toml";
  };

  # ----- claude (per-subdir) -----

  xdg.configFile.personal-claude-md = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/CLAUDE.md";
    target = "../.claude/CLAUDE.md";
  };
  xdg.configFile.personal-claude-settings = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/settings.json";
    target = "../.claude/settings.json";
  };
  xdg.configFile.personal-claude-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/skills";
    target = "../.claude/skills";
  };
  xdg.configFile.personal-claude-hooks = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/hooks";
    target = "../.claude/hooks";
  };
  xdg.configFile.personal-claude-agents = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/agents";
    target = "../.claude/agents";
  };
  xdg.configFile.personal-claude-commands = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/commands";
    target = "../.claude/commands";
  };
  xdg.configFile.personal-claude-statusline = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/statusline.sh";
    target = "../.claude/statusline.sh";
  };
  xdg.configFile.personal-claude-rules = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/rules";
    target = "../.claude/rules";
  };
  xdg.configFile.personal-claude-scripts = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/scripts";
    target = "../.claude/scripts";
  };
  xdg.configFile.personal-claude-prompts = {
    # Source: dotfiles/claude/common/prompts/, migrated into
    # agent-config/claude/shared/prompts by phase 3.9b. Same migration
    # bug #2 fix as phase 8's work-claude-prompts — without this entry
    # the prompts content disappears once phase 9.13 removes the
    # dotfiles/claude/common/ source on personal.
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/prompts";
    target = "../.claude/prompts";
  };

  # ----- pi (per-subdir) -----

  xdg.configFile.personal-pi-agents-md = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/AGENTS.md";
    target = "../.pi/agent/AGENTS.md";
  };
  xdg.configFile.personal-pi-settings = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/settings.json";
    target = "../.pi/agent/settings.json";
  };
  xdg.configFile.personal-pi-keybindings = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/keybindings.json";
    target = "../.pi/agent/keybindings.json";
  };
  xdg.configFile.personal-pi-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/skills";
    target = "../.pi/agent/skills";
  };
  xdg.configFile.personal-pi-extensions = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/extensions";
    target = "../.pi/agent/extensions";
  };
  xdg.configFile.personal-pi-agents-dir = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/agents";
    target = "../.pi/agent/agents";
  };
  xdg.configFile.personal-pi-rules = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/rules";
    target = "../.pi/agent/rules";
  };
  xdg.configFile.personal-pi-data = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/data";
    target = "../.pi/agent/data";
  };

  # NOTE: ~/.pi/agent/git and ~/.pi/agent/sessions INTENTIONALLY OMITTED
  # (pi-managed runtime state). ~/.pi/agent/data is config (holds
  # permission-allowlist.json), so it gets a per-subdir symlink above.
}
