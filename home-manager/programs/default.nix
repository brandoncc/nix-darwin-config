args@{...}:
{
  # Let Home Manager install and manage itself.
  home-manager.enable = true;

  autojump = import ./autojump args;
  git = import ./git args;
  neovim = import ./neovim args;
  tmux = import ./tmux args;
  zsh = import ./zsh args;
}
