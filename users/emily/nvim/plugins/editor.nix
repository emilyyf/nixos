{pkgs, ...}: let
  nvim-dbee = pkgs.vimUtils.buildVimPlugin {
    name = "nvim-dbee";
    src = pkgs.fetchFromGitHub {
      owner = "kndndrj";
      repo = "nvim-dbee";
      rev = "f5dda52ac9360158fd7575bcf55f4c7075551f83";
      hash = "sha256-Ocnt08r44OiuaX6O0Eltu3kCdCuls95ssUYfwuM2ekE=";
    };
  };
in {
  programs.nixvim = {
    plugins = {
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
          close = "<leader>x";
        };
      };

      oil = {
        enable = true;
        settings = {
          columns = [
            "icon"
          ];

          view_options = {
            show_hidden = true;
          };
        };
      };
    };

    extraPlugins = [
      nvim-dbee
      (pkgs.vimUtils.buildVimPlugin {
        name = "cmp-dbee";
        dependecies = [nvim-dbee];
        src = pkgs.fetchFromGitHub {
          owner = "MattiasMTS";
          repo = "cmp-dbee";
          rev = "0feabc1a2ab56d1546038ddf934b17c6a44f6717";
          hash = "sha256-7kMUKeLQ8sZNUAG1AG6wsM1ARs4TZ9SkP6TQZS/RZLY=";
        };
      })
    ];

    extraConfigLua = ''
      require("dbee").install()
      require("dbee").setup()
      require("cmp-dbee").setup({})
    '';
  };
}
