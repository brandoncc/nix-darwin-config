{pkgs, ...}:

{
  programs.tmux = {
    enable = false;
    baseIndex = 1;
    disableConfirmationPrompt = true;
    escapeTime = 0;
    historyLimit = 100000;
    keyMode = "vi";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    tmuxinator.enable = true;

    extraConfig = ''
    set -g default-command "${pkgs.zsh}/bin/zsh"
    '';
  };
}
