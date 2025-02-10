args@{ inputs, config, pkgs, ... }:

{
  editorconfig = import ./editorconfig args;
  fonts = import ./fonts args;
  home = import ./home args;
  programs = import ./programs args;
  xdg = import ./xdg args;
}
