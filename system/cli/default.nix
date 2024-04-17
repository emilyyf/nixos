{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.sessionVariables = {
    EDITOR = "nvim";
  };

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

  environment.shells = with pkgs; [zsh];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
}
