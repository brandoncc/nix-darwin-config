{ lib, ... }:

{
  imports = [ ./common.nix ];

  system.defaults.dock.persistent-apps = [
    "/Applications/Brave Browser.app"
    "/Applications/Spark Desktop.app"
  ];

  homebrew.onActivation = {
    cleanup = "zap"; # uninstall packages not in the list _and_ remove their related files and configurations
    autoUpdate = true;
  };

  homebrew.brews = lib.mkAfter [
    "hydra"
    "vips"
  ];

  homebrew.casks = lib.mkAfter [
    "1password"
    "brave-browser"
    "quicken"
  ];

  homebrew.masApps = {
    "Sleep Control Centre" = 946798523;
    "Spark Mail" = 6445813049;
    Froq = 894339623; # Database GUI
    Kaal = 1572859229;
    Numbers = 409203825;
    Todoist = 585829637;
    Xcode = 497799835;
    Yoink = 457622435;
  };

  launchd.agents.Yoink.serviceConfig = {
    Program = "/Applications/Yoink.app/Contents/MacOS/Yoink";
    ProgramArguments = [];
    RunAtLoad = true;
  };
}
