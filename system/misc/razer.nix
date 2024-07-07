{
  pkgs,
  userSettings,
  ...
}: {
  hardware.openrazer = {
    enable = true;
    users = [userSettings.username];
  };

  environment.systemPackages = with pkgs; [
    polychromatic
  ];
}
