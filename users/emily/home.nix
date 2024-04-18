{
  config,
  pkgs,
  inputs,
  age,
  userSettings,
  systemSettings,
  ...
}: {
  imports =
    [
      ./cli/sh.nix
      ./cli/git.nix
      ./cli/zellij.nix
      ./nvim
    ]
    ++ (
      if systemSettings.system == "x86_64-linux"
      then [
        ./linux
        ./style/qt.nix
        ./style/gtk.nix
        ./style/dunst.nix
        # These two should be universal but I still have to figure out how to
        # set up on darwin and wsl
        ./secrets.nix
        ./cli/spotify.nix
      ]
      else []
    );

  home.username = userSettings.username;
  home.homeDirectory =
    (
      if systemSettings.system == "x86_64-darwin"
      then "/User/"
      else "/home/"
    )
    + userSettings.username;

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
    EDITOR = userSettings.editor;
  };

  programs.home-manager.enable = true;
}
