{pkgs, ...}:

{
  programs.zsh = {
    enable = true;
    autocd = true;

    initExtra = ''
      source ~/.common.zshrc
      source ~/.machine_specific.zshrc
    '';

    autosuggestion = {
      enable = true;
      strategy = ["history" "completion"];
    };

    defaultKeymap = "viins";
    historySubstringSearch.enable = true;

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
