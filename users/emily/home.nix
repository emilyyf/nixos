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

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Macchiato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["pink"];
        size = "compact";
        tweaks = ["rimless" "black"];
        variant = "macchiato";
      };
    };
  };

  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "Catppuccin-Macchiato";
      package = pkgs.catppuccin-kde.override {
        accents = ["pink"];
        flavour = ["macchiato"];
      };
    };
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

  services.dunst = {
    enable = true;
    package = pkgs.dunst.overrideAttrs (_: {
      src = pkgs.fetchFromGitHub {
        owner = "sioodmy";
        repo = "dunst";
        rev = "6477864bd870dc74f9cf76bb539ef89051554525";
        sha256 = "FCoGrYipNOZRvee6Ks5PQB5y2IvN+ptCAfNuLXcD8Sc=";
      };
    });
    iconTheme = {
      package = pkgs.catppuccin-papirus-folders;
      name = "Papirus";
    };
    settings = {
      global = {
        frame_color = "#f4b8e4";
        separator_color = "#f4b8e4";
        corner_radius = 10;
        notification_limit = 3;
        idle_threshold = 120;
        ignore_newline = "no";
        mouse_left_click = "close_current";
        mouse_right_click = "close_all";
        sticky_history = "yes";
        history_length = 20;
        show_age_threshold = 60;
        ellipsize = "middle";
        padding = 10;
        always_run_script = true;
        frame_width = 2;
        transparency = 10;
        progress_bar = true;
        progress_bar_frame_width = 0;
        highlight = "#f4b8e4";
      };
      fullscreen_delay_everything.fullscreen = "delay";
      urgency_low = {
        background = "#303446";
        foreground = "#c6d0f5";
        timeout = 5;
      };
      urgency_normal = {
        background = "#303446";
        foreground = "#c6d0f5";
        timeout = 6;
      };
      urgency_critical = {
        background = "#303446";
        foreground = "#c6d0f5";
        frame_color = "#e78284";
        timeout = 0;
      };
    };
  };
}
