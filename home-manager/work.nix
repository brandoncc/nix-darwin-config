{ ... }:

{
  imports = [ ./common ./work/git ./work/xdg ];

  home.sessionVariables.NIX_DARWIN_MACHINE_NAME = "work";
}
