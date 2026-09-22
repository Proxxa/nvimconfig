return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
	require("which-key").add {
          mode = { "n" },
          {"<C-b><C-f>", vim.lsp.buf.format, desc = "Format buffer"},
          {"<leader>e", "<cmd>Ex<CR>", desc = "Explore directory of current file" }
        }
    end,
    opts = {}
}
