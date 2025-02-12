{pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    initExtra = ''
      # start sudar theme
      _sudar_collapsed_wd() {
        echo $(pwd | perl -pe "
         BEGIN {
            binmode STDIN,  ':encoding(UTF-8)';
            binmode STDOUT, ':encoding(UTF-8)';
         }; s|^$HOME|~|g; s|/([^/])[^/]*(?=/[^/]*/[^/]*/)|/\$1|g
      ")
      }

      local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
      PROMPT='$ret_status%{$fg_bold[green]%}%p %{$fg[cyan]%}$(_sudar_collapsed_wd) %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

      # ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
      ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
      ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
      ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
      ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}";
      # end sudar theme

      # START DEV CONFIG
      [[ -x /opt/homebrew/bin/brew ]] && eval $(/opt/homebrew/bin/brew shellenv)
      [[ -f /opt/dev/sh/chruby/chruby.sh ]] && { type chruby >/dev/null 2>&1 || chruby () { source /opt/dev/sh/chruby/chruby.sh; chruby "$@"; } }
      [ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh
      # END DEV CONFIG

      function clean-merged-branches() {
        REPO=$(pwd) cargo run --manifest-path ~/dev/git-tools/Cargo.toml clean-merged-branches
      }

      function nsetup() {
        if [[ -z "$NIX_DARWIN_MACHINE_NAME" ]]; then
          echo "Error: NIX_DARWIN_MACHINE_NAME is not set." >&2
          return 1
        fi

        darwin-rebuild switch --flake ~/.config/nix-darwin#"$NIX_DARWIN_MACHINE_NAME"
      }
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
    ];

    shellAliases = {
      bo = "bin/bundle outdated > outdated.txt";
      bs = "browser-sync start --proxy \"localhost:3000\" --files \"app/assets/stylesheets/**/*\" --files \"app/views/**/*\"";
      cm = "clean-merged-branches";
      gc = "git checkout";
      gco = "git checkout -b ";
      gl = "git log --graph --all --oneline";
      grb = "git ls-remote origin | grep -v -E 'refs/pull/|refs/heads/shipit-next|HEAD' | sed -E 's/.*refs\/heads\/(.*)/\1/'";
      hr = "heroku run rails c -a $1";
      lg = "lazygit";
      mcd = "mkdir -p $1 && cd $1";
      mux = "tmuxinator start $1";
      nconfig = "cd ~/.config/nix-darwin; nvim .; cd -";
      nupgradeall = "cd ~/.config/nix-darwin; nix flake update; nsetup; cd -";
      ohmyzsh = "nvim ~/.oh-my-zsh";
      p = "git pull";
      pc = "pp && clean-merged-branches";
      pp = "git pull && git fetch origin --prune";
      prune = "git fetch origin --prune";
      podman-reset = "podman machine stop && podman machine rm --force && podman machine init && podman machine start";
      rn = "bin/rspec  --next-failure";
      rno = "bin/rspec --only-failures --next-failure";
      ro = "bin/rspec --only-failures";
      tdsl = "bin/tapioca dsl \$(git diff --name-only && git diff --name-only --cached)";
      tma = "tmux -2 attach -t $1";
      tmcc = "tmux -CC attach";
      tmk = "tmux kill-session -t $1";
      tml = "tmux list-sessions";
      tmn = "tmux new -s $1";
      tmr = "tmux rename-session -t $1 $2";
      v = "nvim $1";
      vim = "nvim $1";
    };
  };
}
