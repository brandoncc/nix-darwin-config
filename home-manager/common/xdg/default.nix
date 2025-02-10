{...}:
let
  dotfiles = ../../../dotfiles;
in  {
  xdg = {
    configFile."aerospace" = {
      source = "${dotfiles}/aerospace/.aerospace.toml";
      target = "../.aerospace.toml"; # ~/.config/../.aerospace
    };

    configFile."editorconfig" = {
      source = "${dotfiles}/editorconfig/.editorconfig";
      target = "../.editorconfig"; # ~/.config/../.editorconfig
    };

    configFile."hammerspoon" = {
      source = "${dotfiles}/hammerspoon/.hammerspoon";
      target = "../.hammerspoon"; # ~/.config/../.hammerspoon
    };

    configFile."nvim-unchained".source = "${dotfiles}/nvim-unchained";
    configFile."wezterm".source = "${dotfiles}/wezterm";

    # configFile."tmux" = {
    #   source = "${dotfiles}/tmux/.tmux.conf";
    #   target = "../.tmux.conf"; # ~/.config/../.tmux.conf
    # };
  };
}
