{ config, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in  {
  home = {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    username = "brandoncc";
    homeDirectory = "/Users/brandoncc";

    file.".common.zshrc".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/zsh/.common.zshrc";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "24.05";

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      NVIM_APPNAME = "nvim-unchained";
    };
  };

  imports = [ ./packages ];
}
