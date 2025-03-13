{ inputs, pkgs, ... }:

let
  neovimNightlyPackage = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
in {
  programs.neovim = {
    enable = true;
    package = neovimNightlyPackage;
    withRuby = false;
  };
}
