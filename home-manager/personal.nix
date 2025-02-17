{ ... }:

{
  imports = [ ./common ./personal/git ./personal/home/packages ./personal/programs/zsh ./personal/xdg ];

  home.sessionVariables.NIX_DARWIN_MACHINE_NAME = "personal";
}
