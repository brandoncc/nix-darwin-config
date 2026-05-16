{ pkgs, lib, ... }:

{
  nix.settings.experimental-features = "nix-command flakes";
  nix.settings.trusted-users = [
    "@admin"
  ];

  # Include Shopify-managed /etc/nix/nix.custom.conf (which !includes shopify.conf)
  nix.extraOptions = ''
    !include nix.custom.conf
  '';

  # Shopify tooling manages /etc/nix/nix.custom.conf as a writable file that
  # configures caches, trusted users, etc. nix-darwin checks for unknown hashes
  # in this file and aborts activation, then deletes it. Hide it before the
  # check runs, and restore it after activation completes.
  system.activationScripts.checks.text = lib.mkBefore ''
    if [[ -e /etc/nix/nix.custom.conf ]]; then
      mv /etc/nix/nix.custom.conf /etc/nix/nix.custom.conf.shopify-backup
    fi
  '';
  system.activationScripts.nix-daemon.text = lib.mkAfter ''
    if [[ -e /etc/nix/nix.custom.conf.shopify-backup ]]; then
      mv /etc/nix/nix.custom.conf.shopify-backup /etc/nix/nix.custom.conf
    fi
    # Also handle if nix-darwin renamed a leftover
    if [[ -e /etc/nix/nix.custom.conf.before-nix-darwin && ! -e /etc/nix/nix.custom.conf ]]; then
      mv /etc/nix/nix.custom.conf.before-nix-darwin /etc/nix/nix.custom.conf
    fi
  '';

  # Set user configuration options in nix-darwin
  users.users.brandoncc = {
    home = "/Users/brandoncc";
    # shell = pkgs.zsh; # managed by home-manager
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  # Enable nix-darwin management
  # This version should match the one you're using (e.g., 23.05 or later)
  system.stateVersion = 5;  # Use the appropriate version here

  system.defaults.dock.orientation = "left";

  system.defaults.dock.persistent-others = [
    "~/Applications"
    "/Users/brandoncc/Downloads"
  ];

  system.defaults.screencapture.location = "~/Screenshots";

  system.defaults.dock.show-recents = false;
  system.defaults.dock.autohide = true;
  system.defaults.finder.NewWindowTarget = "Home";
  system.defaults.finder.ShowPathbar = true;
  system.defaults.finder.ShowStatusBar = true;

  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";

  system.primaryUser = "brandoncc";

  # Set nixpkgs configuration to allow unfree software (if you want proprietary apps)
  nixpkgs.config.allowUnfree = true;

  # Enable macOS-specific settings if needed
  # e.g., enable certain macOS services like Time Machine or user permissions
  # programs.darwin.enable = true;  # This is often set by default in nix-darwin

  # If you need to install additional packages, you can specify them here.
  # Example:
  environment.systemPackages = with pkgs; [
    libffi
  #   git
  #   gh
  #   editorconfig-core-c
  #   inputs.wezterm.packages.${pkgs.system}.default
  #   mkalias # alias nix apps to /Applications
  #   #logseq
  ];

  homebrew = {
    enable = true;
    global.autoUpdate = true;

    taps = [
      "nikitabobko/tap" # for aerospace
    ];

    brews = [
      "watchman" # for sorbet
    ];

    casks = [
      "alfred"
      "hammerspoon"
      "logseq"
      "nikitabobko/tap/aerospace"
      "shortcat"
      "tomatobar"
    ];
  };

  launchd.agents.Hammerspoon.serviceConfig = {
    Program = "/Applications/Hammerspoon.app/Contents/MacOS/Hammerspoon";
    ProgramArguments = [];
    RunAtLoad = true;
  };

  # # Create 'alias'es in /Applications for apps installed by nix
  # system.activationScripts.applications.text = let
  #   env = pkgs.buildEnv {
  #     name = "system-applications";
  #     paths = config.environment.systemPackages;
  #     pathsToLink = "/Applications";
  #   };
  # in
  #   pkgs.lib.mkForce ''
  #     # Set up applications
  #     echo "setting up /Applications..." >&2
  #     rm -rf "/Applications/Nix Apps"
  #     mkdir -p "/Applications/Nix Apps"
  #     find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
  #     while read -r src; do
  #       app_name=$(basename "$src")
  #       echo "copying $src" >&2
  #       ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
  #     done
  #   '';
}
