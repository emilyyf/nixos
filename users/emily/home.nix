{
  config,
  pkgs,
  inputs,
  age,
  ...
}: {
  imports = [
    ./cli/sh.nix
    ./cli/git.nix
    ./cli/zellij.nix
    ./cli/spotify.nix
    ./style/qt.nix
    ./style/gtk.nix
    ./style/dunst.nix
    ./secrets.nix
    ./linux
    ./nvim
  ];

  home.username = "emily";
  home.homeDirectory = "/home/emily";

  home.packages = with pkgs; [
    firefox
    thunderbird
    mupdf
    discord
    telegram-desktop
    tutanota-desktop
    nerdfonts
    prismlauncher
    alejandra
    unzip
  ];

  programs.gpg.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
