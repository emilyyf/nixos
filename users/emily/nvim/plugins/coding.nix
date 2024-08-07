{pkgs, ...}: {
  programs.nixvim.plugins = {
    inc-rename.enable = true;
    efmls-configs.enable = true;
    lsp-format.enable = true;
    luasnip.enable = true;

    treesitter-context = {
      enable = true;
      settings = {
        max_lines = 3;
      };
    };

    treesitter = {
      enable = true;
      indent = true;
      nixvimInjections = true;
    };

    lsp = {
      enable = true;
      keymaps = {
        lspBuf = {
          K = "hover";
          gD = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
        diagnostic = {
          "<leader>j" = "goto_next";
          "<leader>k" = "goto_prev";
        };
      };
      servers = {
        clangd.enable = true;
        nixd.enable = true;
        biome.enable = true;
        jsonls.enable = true;
        pylsp.enable = true;
        tsserver.enable = true;
        volar.enable = true;
        zls.enable = true;
        gopls.enable = true;

        lexical = {
          enable = true;
          cmd = ["${pkgs.lexical}/libexec/start_lexical.sh"];
        };

        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };

        efm = {
          enable = true;
          extraOptions.init_options = {
            documentFormatting = true;
            documentRangeFormatting = true;
            hover = true;
            documentSymbol = true;
            codeAction = true;
            completion = true;
          };
        };
      };
    };

    lspkind = {
      enable = true;

      cmp = {
        enable = true;
        menu = {
          nvim_lsp = "[LSP]";
          nvim_lua = "[api]";
          path = "[path]";
          luasnip = "[snip]";
          buffer = "[buffer]";
          neorg = "[neorg]";
        };
      };
    };

    cmp = {
      enable = true;

      settings = {
        snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

        mapping = {
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.close()";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
        };

        sources = [
          {name = "path";}
          {name = "nvim_lsp";}
          {name = "luasnip";}
          {
            name = "buffer";
            # Words from other open buffers can also be suggested.
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          {name = "neorg";}
        ];
      };
    };
  };
}
