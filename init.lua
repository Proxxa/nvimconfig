-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.cmd [[colorscheme retrobox]]

vim.keymap.set("n", "<Leader>t", "<cmd>vs +term<cr>", { desc = "Open Terminal" })

require 'config.lazy'
