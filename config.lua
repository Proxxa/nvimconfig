local map = require("util.map")

-- Use nu
vim.opt.shell = "nu"

-- Bindings
vim.g.mapleader = " "

map.n("<Leader>t", "<cmd>vs +term<cr>")
map.n("<Leader>e", "<cmd>NvimTreeOpen<cr>")
map.n("<C-s>", ":w<cr>")

map.i("<C-s>", "<esc>:w<cr>i<Right>")

-- Basic settings
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
