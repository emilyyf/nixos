{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim = {
    clipboard.providers.xclip.enable = true;

    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      smartindent = true;
      autoindent = true;

      hlsearch = false;
      incsearch = true;
      ignorecase = true;
      smartcase = true;

      termguicolors = true;
      swapfile = false;
      scrolloff = 8;

      updatetime = 50;
      colorcolumn = "80";
    };
  };
}
