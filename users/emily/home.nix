{
  config,
  pkgs,
  inputs,
  age,
  ...
}: {
  imports = [
    ./sh.nix
    ./zellij.nix
    ./git.nix
    ./spotify.nix
    ./secrets.nix
    ./nvim
  ];

  home.username = "emily";
  home.homeDirectory = "/home/emily";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    inputs.nix-citizen.packages.${system}.star-citizen
    inputs.nix-citizen.packages.${system}.star-citizen-helper
    inputs.nix-citizen.packages.${system}.lug-helper
    firefox
    thunderbird
    discord
    telegram-desktop
    tutanota-desktop
    xivlauncher
    spotify
    wineWowPackages.stable
    winetricks
    lsp-plugins
    calf
    protontricks
    mangohud
    airwindows-lv2
    x42-plugins
    guitarix
    nerdfonts
    gamescope
    htop
    prismlauncher
    spectacle
    xsel
    xclip
    alejandra
    unzip
    wineasio
  ];

  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xsession.profileExtra = ''
    eval $(${pkgs.gnome.gnome-keyring}/bin/gnome-keyring-daemon --daemonize --components=ssh,secrets)
    export SSH_AUTH_SOCK
  '';

  programs.home-manager.enable = true;

  targets.genericLinux.enable = true;

  xdg.enable = true;
}
