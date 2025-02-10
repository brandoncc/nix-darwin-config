{...}:

let
  dotfiles = ../../../dotfiles;
in  {
    xdg.configFile."butler.nvim".source = "${dotfiles}/butler.nvim";

    xdg.configFile."tmuxinator" = {
      source = "${dotfiles}/tmuxinator/.tmuxinator";
      target = "../.tmuxinator"; # ~/.config/../.tmuxinator
    };
}
