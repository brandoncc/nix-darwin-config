{...}:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ./aerospace
    ./autojump
    ./git
    ./lazygit
    ./neovim
    ./tmux
    ./visidata
    ./zellij
    ./zsh
  ];
}
