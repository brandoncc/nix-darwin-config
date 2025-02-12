{ lib, ... }:

{
  imports = [ ./common.nix ];

  homebrew.onActivation.cleanup = "none"; # do not remove homebrew packages installed outside of nix

  system.defaults.dock.persistent-apps = [
    "/Applications/Logseq.app"
    "/Applications/Google Chrome.app"
    "/Applications/Shopify Mail.app"
    "~/Applications/Chrome Apps/Taskarific.app"
    "~/Applications/Chrome Apps/Workplace.app"
    "/Applications/Shopify Calendar.app"
    "/Applications/Google Drive.app"
  ];

  system.defaults.dock.persistent-others = lib.mkAfter [
    "~/Screenshots"
  ];
}
