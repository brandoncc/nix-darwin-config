{ pkgs, lib, ... }:

{
  imports = [ ./common ./work/git ./work/xdg ];

  home.sessionVariables.NIX_DARWIN_MACHINE_NAME = "work";

  home.packages = with pkgs; lib.mkAfter [
    # --- devenv replacements (remove once devenv is
    # installed on work machine) ---
    bats
    luajitPackages.luacheck
    shellcheck
    shfmt
    stylua
    yamllint
    # --- end devenv replacements ---
  ];
}
