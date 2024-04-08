{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim.plugins = {
    lightline.enable = true;
    multicursors.enable = true;
    rainbow-delimiters.enable = true;
    inc-rename.enable = true;

    noice = {
      enable = true;
      presets = {
        bottom_search = true;
        command_palette = true;
        long_message_to_split = true;
        inc_rename = true;
        lsp_doc_border = false;
      };
    };

    telescope = {
      enable = true;
      keymaps = {
        "<C-p>" = "git_files";
        "<leader>ff" = "find_files";
        "<leader>fg" = "live_grep";
        "<leader>fb" = "buffers";
        "<leader>fh" = "help_tags";
      };
    };

    barbar = {
      enable = true;
      keymaps = {
        silent = true;

        next = "<TAB>";
        previous = "<S-TAB>";
        close = "<C-w>";
      };
    };
  };
}
