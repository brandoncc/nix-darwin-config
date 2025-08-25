{pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";

    initContent = ''
      # Ensure homebrew paths are in PATH. We have to do this manually because
      # using programs.zsh.dotDir causes these paths to be removed for some
      # reason.
      #
      # ref: https://github.com/nix-community/home-manager/issues/6483
      homebrewBinPath="/opt/homebrew/bin"
      brewBinaryPath="$homebrewBinPath/brew"
      masBinPath="/opt/homebrew/sbin"

      if [ -f "$brewBinaryPath" ]; then
        if [ -d "$masBinPath" ]; then
          if [[ ":$PATH:" != *":$masBinPath:"* ]]; then
            export PATH="$masBinPath:$PATH"
          fi
        fi

        if [[ ":$PATH:" != *":$homebrewBinPath:"* ]]; then
          export PATH="$homebrewBinPath:$PATH"
        fi
      fi

      source ~/.common.zshrc
      source ~/.zshrc

      # Make sure that dev can't override my wrappers such as `git`. Put this line LAST so that other scripts can't prepend earlier.
      export PATH="$HOME/bin:$PATH"
    '';

    autosuggestion = {
      enable = true;
      strategy = ["history" "completion"];
    };

    oh-my-zsh = {
      enable = true;
      plugins = ["autojump"];
      # theme = "sudar";
    };

    plugins = [
      {
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.1";
          sha256 = "02p5wq93i12w41cw6b00hcgmkc8k80aqzcy51qfzi0armxig555y";
        };
      }
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.2.0";
          sha256 = "sha256-q26XVS/LcyZPRqDNwKKA9exgBByE0muyuNb0Bbar2lY=";
        };
      }
    ];
  };
}
