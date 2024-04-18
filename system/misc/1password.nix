{
  config,
  pkgs,
  inputs,
  userSettings,
  systemSettings,
  ...
}: {
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [userSettings.username];
  };
}
