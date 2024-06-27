{systemSettings, ...}: {
  programs.nixvim = {
    clipboard.providers.xclip.enable = systemSettings.system == "x86_64-linux";

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

      inccommand = "split";

      updatetime = 50;
      colorcolumn = "80";
      lcs = "tab:<->,space:.,eol:$";
    };
  };
}
