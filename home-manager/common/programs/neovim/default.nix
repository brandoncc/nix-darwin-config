{ inputs, pkgs, ... }:

let
  neovimNightlyPackage = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  programs.neovim = {
    enable = true;
    package = neovimNightlyPackage;
    withPython3 = true;
    withRuby = false;
  };
}
