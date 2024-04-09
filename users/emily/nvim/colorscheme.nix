{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    flavour = "macchiato";
    integrations = {
      barbar = true;
      cmp = true;
      noice = true;
      rainbow_delimiters = true;
      treesitter = true;
      treesitter_context = true;
    };
  };
}
