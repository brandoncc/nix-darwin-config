args@{ inputs, pkgs, ... }:

let
  neovimNightlyPackage = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
in {
  enable = true;
  package = neovimNightlyPackage;
}
