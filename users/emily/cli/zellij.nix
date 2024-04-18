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
      # copy_command "pbcopy"  #os x
      pane_frames = false;
    };
  };
}
