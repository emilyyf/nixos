{
  config,
  pkgs,
  inputs,
  userSettings,
  systemSettings,
  ...
}: {
  environment.sessionVariables = {
    EDITOR = userSettings.editor;
  };

  users.defaultUserShell = pkgs.zsh;
}
