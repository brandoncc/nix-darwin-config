{pkgs, ...}:

{
  home.packages =
    with pkgs; [
      # _1password-gui # broken!
      _1password-cli
      difftastic
      fzf
      gh
      go
      kitty
      # libsass # required for sassc Ruby gem
      # libyaml.dev # required for psych Ruby gem
      nerd-fonts.droid-sans-mono
      nerd-fonts.fira-code
      nodejs_24
      ollama
      overmind
      ripgrep
      ruby_3_3
      rustup
      # sassc
      stow
      tableplus
      yarn-berry
    ];
}
