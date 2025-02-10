# Setup

The initial setup needs to use the `darwin-rebuild` command. Once setup has completed once, there are `nsetup`, `nconfig`, and `nupgradeall` zsh aliases to manage the nix config.

- `git clone https://github.com/brandoncc/nix-darwin-config.git ~/.config/nix-darwin`
- `NIX_DARWIN_MACHINE_NAME=personal darwin-rebuild switch --flake ~/.config/nix-darwin#"$NIX_DARWIN_MACHINE_NAME"`
