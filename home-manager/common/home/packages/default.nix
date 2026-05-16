{pkgs, ...}:

{
  home.packages =
    with pkgs; [
      # _1password-gui # broken!
      _1password-cli
      bun
      fzf
      gh
      go
      kitty
      # libsass # required for sassc Ruby gem
      # libyaml.dev # required for psych Ruby gem
      nerd-fonts.droid-sans-mono
      nerd-fonts.fira-code
      nodejs-slim_24
      ollama
      pnpm
      overmind
      ripgrep
      ruby_3_3
      rustup
      # sassc
      stow
      yarn-berry
    ];
}
