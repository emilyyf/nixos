{
  pkgs,
  userSettings,
  systemSettings,
  ...
}: {
  home.packages = with pkgs.gitAndTools; [git-crypt];

  programs.git = {
    enable = true;
    userName = userSettings.name;
    userEmail = userSettings.email;

    signing = (
      if !systemSettings.isWsl
      then {
        key = "0xB909D47D931FCC5B";
        signByDefault = true;
      }
      else {}
    );

    ignores = [
      "*.swp"
      ".direnv/"
      "node_modules"
      "result"
      "result-*"
      "*.orig"
      "*.rej"
      ".env"
      ".envrc"
    ];

    extraConfig = {
      init = {defaultBranch = "main";};
      delta = {
        line-numbers = true;
      };
      branch.autosetupmerge = "true";
      push.default = "current";
      merge.stat = "true";
      repack.usedeltabaseoffset = "true";
      pull.ff = "only";
    };

    lfs.enable = true;

    includes = [
      {
        path = pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/catppuccin/delta/765eb17d0268bf07c20ca439771153f8bc79444f/catppuccin.gitconfig";
          sha256 = "1spw0nyb52kh2y4gybivjqgvaraaka4r1ww6v8msnzq69w7zi10i";
        };
      }
    ];

    delta = {
      enable = true;
      options = {
        features = "catppuccin-macchiato";
      };
    };

    aliases = {
      essa = "push --force";
      co = "checkout";
      fuck = "commit --amend -m";
      c = "commit -m";
      ca = "commit -am";
      forgor = "commit --amend --no-edit";
      graph = "log --all --decorate --graph --oneline";
      oops = "checkout --";
      l = "log";
      r = "rebase";
      s = "status --short";
      ss = "status";
      d = "diff";
      ps = "!git push origin $(git rev-parse --abbrev-ref HEAD)";
      pl = "!git pull origin $(git rev-parse --abbrev-ref HEAD)";
      af = "!git add $(git ls-files -m -o --exclude-standard | sk -m)";
      st = "status";
      br = "branch";
      df = "!git hist | peco | awk '{print $2}' | xargs -I {} git diff {}^ {}";
      hist = ''
        log --pretty=format:"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)" --graph --date=relative --decorate --all'';
      llog = ''
        log --graph --name-status --pretty=format:"%C(red)%h %C(reset)(%cd) %C(green)%an %Creset%s %C(yellow)%d%Creset" --date=relative'';
      edit-unmerged = "!f() { git ls-files --unmerged | cut -f2 | sort -u ; }; hx `f`";
    };
  };
}
