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
  nixpkgs.hostPlatform = systemSettings.system;

  system = {
    configurationRevision = self.rev or self.dirtyRev or null;
    stateVersion = 4;
    defaults.dock.autohide = true;
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

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
    ];
  };
}
