{systemSettings, ...}: {
  imports = [
    ../../system/cli
  ];

  wsl.enable = true;
  wsl.wslConf.network.hostname = systemSettings.hostname;
  networking.hostName = systemSettings.hostname;

  systemd.services.nix-daemon.environment = {
    HTTP_PROXY = "";
    HTTPS_PROXY = "";
  };

  system.stateVersion = "23.11";
  nix.settings.experimental-features = "nix-command flakes";
}
