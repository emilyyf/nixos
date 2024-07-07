{
  config,
  pkgs,
  userSettings,
  systemSettings,
  ...
}: {
  imports =
    [
      ./cli/sh.nix
      ./cli/git.nix
      ./cli/zellij.nix
      ./cli/ssh.nix
      ./nvim
    ]
    ++ (
      if systemSettings.system == "x86_64-linux" && !systemSettings.isWsl
      then [
        ./linux
        ./style/qt.nix
        ./style/gtk.nix
        ./style/dunst.nix
        # These three should be universal but I still have to figure out how to
        # set up on darwin and wsl
        ./secrets.nix
        ./cli/spotify.nix
      ]
      else []
    )
    ++ (
      if !systemSettings.isWsl
      then [
        ./app/firefox.nix
        ./app/kitty.nix
      ]
      else []
    );

  home = {
    username = userSettings.username;
    homeDirectory =
      (
        if systemSettings.system == "x86_64-darwin"
        then "/Users/"
        else "/home/"
      )
      + userSettings.username;

    packages = with pkgs; [
      nerdfonts
      alejandra
      unzip
    ];

    sessionVariables = {
      EDITOR = userSettings.editor;
      FLAKE = config.home.homeDirectory + "/.dotfiles/nixos";
    };
  };

  programs = {
    gpg.enable = true;
    home-manager.enable = true;
  };

  home.stateVersion = "23.11"; # DO NOT CHANGE
}
