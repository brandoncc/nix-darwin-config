# Setup

The initial setup needs to use the `darwin-rebuild` command. Once setup has completed once, there are `nsetup`, `nconfig`, and `nupgradeall` zsh aliases to manage the nix config.

- `curl -L https://nixos.org/nix/install | sh`
- Restart your machine so that installing nix-darwin won't blow up when it tries to create /run, then run setup script again
- `git clone https://github.com/brandoncc/nix-darwin-config.git ~/.config/nix-darwin`
- `nix run --extra-experimental-features nix-command --extra-experimental-features flakes nix-darwin -- switch --flake ~/.config/nix-darwin#MACHINE_NAME`
