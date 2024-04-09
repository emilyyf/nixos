{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings =
      {
        command_timeout = 1000;
        scan_timeout = 3;
        palette = "catppuccin_macchiato";
      }
      // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          }
          + /palettes/macchiato.toml));
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    defaultKeymap = "viins";

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.8.0";
          sha256 = "sha256-Z6EYQdasvpl1P78poj9efnnLj7QQg13Me8x1Ryyw+dM=";
        };
      }
    ];

    shellAliases = {
      md = "mkdir -p";
      v = "nvim";
      vi = "nvim";
      vim = "nvim";
      javar = "java -jar";
      ping = " ping -c 5";
      "cd.." = "cd ..";
      shr = "source ~/.zshrc";
      she = "vim ~/.zshrc";
      ls = "eza";
      l = "eza -lah";
      cd = "z";
      cat = "bat";
      top = "btop";
      ":3" = "echo";
      gch = "git checkout";
      gchn = "git checkout -b";
      gc = "git commit";
      gpm = "git commit -pm";
      ga = "git add";
      gaa = "git add .";
      gs = "git status";
      gi = "git init .";
      gps = "git push";
      gpl = "git pull";
      gd = "git diff";
      gl = "git log";
      yolo = "git commit -m \"$(curl -s whatthecommit.com/index.txt)\"";
      bye = "shutdown now";
      fkbye = "halt";
      cya = "reboot";
      please = "sudo";
      dn = "date +\"%Y%m%d %H%M %Z\"";
      aoeu = "setxkbmap us";
      asdf = "setxkbmap us dvorak";
      updh = "home-manager switch --flake .";
      upds = "sudo nixos-rebuild switch --flake .";
    };

    initExtra = ''
         mkcd() {
         	mkdir -p "$@" && cd "$_"
         }

      eval "$(zoxide init zsh)"
    '';
  };
}
