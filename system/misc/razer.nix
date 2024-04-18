{
  config,
  pkgs,
  inputs,
  userSettings,
  systemSettings,
  ...
}: {
  hardware.openrazer.enable = true;
  hardware.openrazer.users = [userSettings.username];

  environment.systemPackages = with pkgs; [
    polychromatic
  ];
}
