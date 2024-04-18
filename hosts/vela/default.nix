{
  self,
  config,
  pkgs,
  inputs,
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
}
