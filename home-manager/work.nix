{ ... }:

{
  imports = [ ./common ./work/git .work/home ];

  home.sessionVariables.NIX_DARWIN_MACHINE_NAME = "work";
}
