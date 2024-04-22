{
  config,
  pkgs,
  inputs,
  age,
  ...
}: {
  home.packages = with pkgs; [
    # Games
    inputs.nix-citizen.packages.${system}.star-citizen
    inputs.nix-citizen.packages.${system}.star-citizen-helper
    inputs.nix-citizen.packages.${system}.lug-helper
    xivlauncher
    wineWowPackages.stable
    winetricks
    protontricks
    mangohud
    gamescope
    prismlauncher
    lutris
    gnome3.adwaita-icon-theme

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
    discord
    telegram-desktop
    tutanota-desktop
    spectacle
    xsel
    xclip
  ];
}
