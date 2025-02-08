{pkgs, ...}:

with pkgs; [
  # _1password-gui # broken!
  _1password-cli
  clang-tools
  devenv
  direnv
  discord
  gh
  go
  heroku
  # libsass # required for sassc Ruby gem
  # libyaml.dev # required for psych Ruby gem
  nerd-fonts.droid-sans-mono
  nerd-fonts.fira-code
  ngrok
  overmind
  ripgrep
  ruby_3_3
  rustup
  # sassc
  stow
  tree
  wezterm
  yarn-berry
]
