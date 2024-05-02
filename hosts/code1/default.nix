{...}: {
  imports = [
    ../../system/cli
  ];

  wsl.enable = true;

  system.stateVersion = "23.11";
  nix.settings.experimental-features = "nix-command flakes";
}
