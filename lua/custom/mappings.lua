local M = {}

M.other = {
   v = {
      ["Y"] = { [["+y]], "一键复制到系统剪切板" },
   },
}

M.lspconfig = {
   v = {
      ["<leader>fr"] = {
         function()
            local old_func = vim.go.operatorfunc
            _G.op_func_formatting = function()
               local start = vim.api.nvim_buf_get_mark(0, "[")
               local finish = vim.api.nvim_buf_get_mark(0, "]")
               vim.lsp.buf.range_formatting({}, start, finish)
               vim.go.operatorfunc = old_func
               _G.op_func_formatting = nil
            end
            vim.go.operatorfunc = "v:lua.op_func_formatting"
            vim.api.nvim_feedkeys("g@", "n", false)
         end,
         "   lsp range formatting",
      },
   },
}

return M
