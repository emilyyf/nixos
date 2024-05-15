{
  pkgs,
  userSettings,
  ...
}: {
  environment.sessionVariables = {
    EDITOR = userSettings.editor;
  };

  users.defaultUserShell = pkgs.zsh;
}
