{...}:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./aerospace
    ./autojump
    ./git
    ./neovim
    ./tmux
    ./zellij
    ./zsh
  ];
}
