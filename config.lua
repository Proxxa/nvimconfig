local map = require("util.map")

-- Use nu
vim.opt.shell = "nu"

-- Bindings
vim.g.mapleader = " "

-- Bindings/Tabs

-- Bindings/Buffers
map.n("<C-q>", ":q<cr>")
map.n("<C-s>", ":w<cr>")
map.i("<C-s>", "<esc>:w<cr>i<Right>")

-- Bindings/Windows
map.n("<Leader>t", "<cmd>vs +term<cr>")

-- Basic settings
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Don't want to reset curdir when loading a view
vim.cmd "set viewoptions-=curdir"

-- Folding Save
local foldaug = vim.api.nvim_create_augroup("FoldingSave", {})

vim.api.nvim_create_autocmd("BufWinLeave", {
    group = foldaug,
    callback = function(ev)
        local bufnr = vim.fn.bufnr("%")
        local isfile = vim.fn.getbufvar(bufnr, "&buftype") == ""
        if isfile then
            vim.cmd "silent! mkview"
        end
    end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    group = foldaug,
    command = "silent! loadview",
})
