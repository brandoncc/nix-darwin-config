{ lib, ... }:

{
  programs.zsh.oh-my-zsh.plugins = lib.mkAfter [ "direnv" ];
}
