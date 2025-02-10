{ lib, ... }:

{
  imports = [ ./common.nix ];

  system.defaults.dock.persistent-apps = [
    "/Applications/Brave Browser.app"
    "/Applications/Spark Desktop.app"
  ];

  homebrew.casks = lib.mkAfter [
    "1password"
    "brave-browser"
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
    RunAtLoad = true;
  };
}
