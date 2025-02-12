{ lib, ... }:

{
  imports = [ ./common.nix ];

  homebrew.onActivation.cleanup = "none"; # do not remove homebrew packages installed outside of nix

  system.defaults.dock.persistent-others = lib.mkAfter [
    "~/Screenshots"
  ];
}
