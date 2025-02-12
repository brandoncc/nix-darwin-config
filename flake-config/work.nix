{ config, pkgs, inputs, ... }:

{
  imports = [ ./common.nix ];

  homebrew.onActivation.cleanup = "none"; # do not remove homebrew packages installed outside of nix
}
