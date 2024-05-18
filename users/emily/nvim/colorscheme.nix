{...}: {
  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
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
  };
}
