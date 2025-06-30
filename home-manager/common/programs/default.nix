{...}:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./autojump
    ./git
    ./neovim
    ./tmux
    ./zellij
    ./zsh
  ];
}
