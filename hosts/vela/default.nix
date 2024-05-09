{
  self,
  systemSettings,
  ...
}: {
  imports = [
    ../../system/cli
  ];
  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 4;
  nixpkgs.hostPlatform = systemSettings.system;
  system.defaults.dock.autohide = true;
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
    };

    casks = [
      "firefox"
      "kitty"
      "1password"
      "insomnia"
    ];
  };
}
