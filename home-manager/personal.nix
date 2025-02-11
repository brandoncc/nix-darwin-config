{ ... }:

{
  imports = [ ./common ./personal/git ./personal/home/packages ];

  home.sessionVariables.NIX_DARWIN_MACHINE_NAME = "personal";
}
