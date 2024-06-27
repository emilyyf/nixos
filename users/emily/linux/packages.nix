{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs;
  with inputs; [
    # Games
    nix-citizen.packages.${system}.star-citizen
    nix-citizen.packages.${system}.star-citizen-helper
    nix-citizen.packages.${system}.lug-helper
    xivlauncher
    wineWowPackages.stable
    winetricks
    protontricks
    mangohud
    gamescope
    prismlauncher
    lutris
    gnome3.adwaita-icon-theme
    r2modman
    osu-lazer-bin

    # Audio
    lsp-plugins
    calf
    airwindows-lv2
    x42-plugins
    guitarix
    wineasio

    # Misc
    firefox
    thunderbird
    mupdf
    zathura
    discord
    telegram-desktop
    tutanota-desktop
    spectacle
    scrot
    xsel
    xclip
    insomnia
  ];
}
