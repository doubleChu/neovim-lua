return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  -- 编辑只读文件
  ["lambdalisue/suda.vim"] = {
    cmd = "SudaWrite",
  },
  ["abecodes/tabout.nvim"] = {
    config = function()
      require("tabout").setup {}
    end,
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" },
  },
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- 开启dashboard
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["glepnir/lspsaga.nvim"] = {
    config = function()
      local saga = require "lspsaga"
      saga.init_lsp_saga {
        -- need neovim 0.8+, not for now
        -- symbol_in_winbar = {
        --    in_custom = true,
        -- },
      }
    end,
  },
  ["gaelph/logsitter.nvim"] = {
    after = { "nvim-treesitter" },
  },
  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("neoscroll").setup()
    end,
  },
  ["smjonas/snippet-converter.nvim"] = {
    config = function()
      require("luasnip.loaders.from_vscode").load(opts)
      local template = {
        name = "Remove license snippets",
        sources = {
          vscode_luasnip = {"./friendly-snippets/snippets"}
        },
        output = {
          vscode_luasnip = { vim.fn.stdpath("config") .. "/vscode_snippets" }
        },
        transform_snippets = function(snippet, helper)
         if snippet.path:find("friendly-snippets/snippets/global.json") and snippet.trigger.match("License") then
           return false
         end
        end
      }
      require("snippet_converter").setup {
        templates = {template}
      }
    end,
  }
}
