{
  config,
  pkgs,
  inputs,
  age,
  ...
}: {
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Macchiato";
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 9;
    };
  };
}
