{ config, ... }:

let
  dotfiles    = "${config.home.homeDirectory}/.dotfiles";
  agentMerged = "${config.home.homeDirectory}/.local/share/agent-config/merged";
in {
  # ----- non-agent xdg entries (preserved from old config) -----

  xdg.configFile.work-zsh = {
    source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/.work.zshrc";
    target = "../.zshrc";
  };

  # ----- claude (per-subdir, NOT whole ~/.claude) -----

  xdg.configFile.work-claude-md = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/CLAUDE.md";
    target = "../.claude/CLAUDE.md";
    force = true;
  };
  xdg.configFile.work-claude-settings = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/settings.json";
    target = "../.claude/settings.json";
    force = true;
  };
  xdg.configFile.work-claude-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/skills";
    target = "../.claude/skills";
  };
  xdg.configFile.work-claude-hooks = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/hooks";
    target = "../.claude/hooks";
  };
  xdg.configFile.work-claude-agents = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/agents";
    target = "../.claude/agents";
  };
  xdg.configFile.work-claude-commands = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/commands";
    target = "../.claude/commands";
  };
  xdg.configFile.work-claude-statusline = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/statusline.sh";
    target = "../.claude/statusline.sh";
  };
  xdg.configFile.work-claude-rules = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/rules";
    target = "../.claude/rules";
  };
  xdg.configFile.work-claude-scripts = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/scripts";
    target = "../.claude/scripts";
  };
  xdg.configFile.work-claude-prompts = {
    # Source: dotfiles/claude/common/prompts/, migrated into
    # agent-config/claude/shared/prompts by phase 3.9b. Today's live
    # ~/.claude/prompts/ holds action-plan-*.md used by claude code;
    # losing this symlink would silently break those prompts.
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/claude/prompts";
    target = "../.claude/prompts";
  };

  # ----- pi (per-subdir, NOT whole ~/.pi/agent) -----

  xdg.configFile.work-pi-agents-md = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/AGENTS.md";
    target = "../.pi/agent/AGENTS.md";
  };
  xdg.configFile.work-pi-settings = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/settings.json";
    target = "../.pi/agent/settings.json";
    force = true;
  };
  xdg.configFile.work-pi-keybindings = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/keybindings.json";
    target = "../.pi/agent/keybindings.json";
  };
  xdg.configFile.work-pi-skills = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/skills";
    target = "../.pi/agent/skills";
  };
  xdg.configFile.work-pi-extensions = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/extensions";
    target = "../.pi/agent/extensions";
  };
  xdg.configFile.work-pi-agents-dir = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/agents";
    target = "../.pi/agent/agents";
  };
  xdg.configFile.work-pi-rules = {
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/rules";
    target = "../.pi/agent/rules";
  };
  # NOTE: work-pi-user-context REMOVED. ~/.pi/agent/user-context.md
  # was symlinked under the old layout to pi-config-work/user-context.md,
  # but that source was deleted in an earlier migration phase and
  # nothing was migrated into agent-config to replace it. Reinstate this
  # block (and add the merge-tree source) if user-context.md is needed.
  xdg.configFile.work-pi-data = {
    # ~/.pi/agent/data is config (permission-allowlist.json), not runtime.
    # The old layout symlinked it to pi-config-work/data/. Phase 5.4 copied
    # that content into agent-config-work/pi/work/data/, so it surfaces
    # in the merged tree at merged/pi/data/.
    source = config.lib.file.mkOutOfStoreSymlink "${agentMerged}/pi/data";
    target = "../.pi/agent/data";
  };

  # NOTE: ~/.pi/agent/git, ~/.pi/agent/bin, ~/.pi/agent/sessions,
  # ~/.pi/agent/auth.json INTENTIONALLY OMITTED. These are
  # pi-managed runtime state and must remain real (non-symlinked) dirs.
}
