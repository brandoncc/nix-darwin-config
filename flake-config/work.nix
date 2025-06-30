{ config, lib, ... }:

{
  imports = [ ./common.nix ];

  # This will get added by dev everytime I rebuild otherwise. This causes dev to restart the nix daemon.
  nix.extraOptions = ''
    !include nix.conf.d/dev.conf
  '';

  homebrew.onActivation.cleanup = "none"; # do not remove homebrew packages installed outside of nix

  homebrew.casks = lib.mkAfter [
    "jordanbaird-ice"
  ];

  system.defaults.dock.persistent-apps = [
    "/Applications/Logseq.app"
    "/Applications/Google Chrome.app"
    "${config.users.users.brandoncc.home}/Applications/Chrome Apps.localized/Gmail.app"
    "${config.users.users.brandoncc.home}/Applications/Chrome Apps.localized/Taskarific.app"
    "${config.users.users.brandoncc.home}/Applications/Chrome Apps.localized/Google Calendar.app"
    "/Applications/Google Drive.app"
  ];

  system.defaults.dock.persistent-others = lib.mkAfter [
    "${config.users.users.brandoncc.home}/Screenshots"
  ];

  homebrew.brews = lib.mkAfter [
    "uv"
  ];
}
