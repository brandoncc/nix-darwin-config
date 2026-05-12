{ inputs, pkgs, ... }:

let
  neovimNightlyPackage = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  programs.neovim = {
    enable = true;
    package = neovimNightlyPackage;
    withPython3 = true;
    withRuby = false;

    # nvim-treesitter `main` branch shells out to the `tree-sitter` CLI to
    # compile parsers on demand. Make sure it's on nvim's PATH.
    # See ~/.dotfiles/nvim-unchained/lua/plugins/treesitter.lua for why
    # we're on `main` and not `master`.
    extraPackages = [ pkgs.tree-sitter ];
  };
}
