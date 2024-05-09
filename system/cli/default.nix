{
  pkgs,
  inputs,
  systemSettings,
  ...
}: {
  imports =
    if systemSettings.system == "x86_64-linux"
    then [
      ./linux.nix
    ]
    else [];

  environment.systemPackages = with pkgs; [
    vim
    neovim
    zellij
    git
    curl
    wget
    gnumake
    stow
    clang
    ripgrep
    fzf
    fd
    dust
    eza
    zoxide
    btop
    bottom
    bat
    delta
    tldr
    onefetch
    fastfetch
    cpufetch
    gping
    nix-prefetch-git
    inputs.agenix.packages."${system}".default
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
  };

  environment.shells = with pkgs; [zsh];
  programs.zsh.enable = true;
}
