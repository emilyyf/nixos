{
  config,
  pkgs,
  inputs,
  userSettings,
  systemSettings,
  ...
}: {
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = config.home.homeDirectory + "/.ssh/github";
      };
    };
  };
}
