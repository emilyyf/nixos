{systemSettings, ...}: {
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "catppuccin-macchiato";
      copy_command =
        if systemSettings.system == "x86_64-darwin"
        then "pbcopy"
        else "xclip -selection clipboard";
      pane_frames = false;
    };
  };
}
