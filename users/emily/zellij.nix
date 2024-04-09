{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "catppuccin-macchiato";
      copy_command = "xclip -selection clipboard";
      pane_frames = false;
    };
  };
}
