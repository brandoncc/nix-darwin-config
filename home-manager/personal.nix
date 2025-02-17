{ ... }:

{
  imports = [ ./common ./personal/git ./personal/home ./personal/home/packages ./personal/programs/zsh ];

  home.sessionVariables.NIX_DARWIN_MACHINE_NAME = "personal";
}
