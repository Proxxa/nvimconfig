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
