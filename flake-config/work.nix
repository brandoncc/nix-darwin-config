{ config, lib, ... }:

{
  imports = [ ./common.nix ];

  homebrew.onActivation.cleanup = "none"; # do not remove homebrew packages installed outside of nix

  system.defaults.dock.persistent-apps = [
    "/Applications/Logseq.app"
    "/Applications/Google Chrome.app"
    "${config.users.users.brandoncc.home}/Applications/Chrome Apps.localized/Gmail.app"
    "${config.users.users.brandoncc.home}/Applications/Chrome Apps.localized/Taskarific.app"
    "${config.users.users.brandoncc.home}/Applications/Chrome Apps.localized/Workplace.app"
    "${config.users.users.brandoncc.home}/Applications/Chrome Apps.localized/Google Calendar.app"
    "/Applications/Google Drive.app"
  ];

  system.defaults.dock.persistent-others = lib.mkAfter [
    "~/Screenshots"
  ];
}
