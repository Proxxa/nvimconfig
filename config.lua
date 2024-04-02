-- Use nu
vim.opt.shell = "nu"

-- Bindings
vim.g.mapleader = " "

local nmap = function(lhs, rhs) vim.keymap.set("n", lhs, rhs) end
nmap("<Leader>t", "<cmd>vs +term<cr>")
nmap("<Leader>e", "<cmd>NvimTreeOpen<cr>")

-- Basic settings
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true


