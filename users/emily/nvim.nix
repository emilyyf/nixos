{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    globals.mapleader = " ";
    clipboard.providers.xclip.enable = true;

    opts = {
      number = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      smartindent = true;

      hlsearch = false;
      incsearch = true;

      termguicolors = true;

      scrolloff = 8;

      updatetime = 50;
      colorcolumn = "80";
    };

    keymaps = [
      {
        key = "<leader>pv";
        action = "vim.cmd.Ex";
        lua = true;
      }
      {
        mode = ["v"];
        key = "J";
        action = ":m '>+1<CR>gv=gv";
      }
      {
        mode = ["v"];
        key = "K";
        action = ":m '<-2<CR>gv=gv";
      }
      {
        mode = ["n"];
        key = "J";
        action = "mzJ`z";
      }
      {
        mode = ["n"];
        key = "<C-d>";
        action = "<C-d>zz";
      }
      {
        mode = ["n"];
        key = "<C-u>";
        action = "<C-u>zz";
      }
      {
        mode = ["n"];
        key = "n";
        action = "nzzzv";
      }
      {
        mode = ["n"];
        key = "N";
        action = "Nzzzv";
      }
      {
        mode = ["n"];
        key = "Q";
        action = "<nop>";
      }
      {
        mode = ["n"];
        key = "<leader>f";
        action = "vim.lsp.buf.format";
        lua = true;
      }
      {
        mode = ["n"];
        key = "<tab>";
        action = "vim.cmd.bnext";
        lua = true;
      }
      {
        mode = ["n"];
        key = "<S-tab>";
        action = "vim.cmd.bNext";
        lua = true;
      }
      {
        mode = ["n"];
        key = "<leader>x";
        action = "vim.cmd.bdelete";
        lua = true;
      }
      {
        mode = ["n" "v"];
        key = "<leader>y";
        action = "[[\"+y]]";
        lua = true;
      }
      {
        mode = ["n" "v"];
        key = "<leader>d";
        action = "[[\"_d]]";
        lua = true;
      }
      {
        mode = ["n"];
        key = "<leader>Y";
        action = "[[\"+Y]]";
        lua = true;
      }
      {
        mode = ["x"];
        key = "<leader>p";
        action = "[[\"_dP]]";
        lua = true;
      }
    ];
  };
}
