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

  environment.systemPackages =
    (with pkgs; [
      neovim
      zellij
      git
      curl
      wget
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
      gping
      nix-prefetch-git
    ])
    ++ [
      inputs.agenix.packages."${pkgs.system}".default
    ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
  };

  environment.shells = with pkgs; [zsh];
  programs.zsh.enable = true;
}
