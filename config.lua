-- Use nu
vim.opt.shell = "nu"

-- Bindings
vim.g.mapleader = " "

local nmap = function(lhs, rhs) vim.keymap.set("n", lhs, rhs, { silent = true }) end
nmap("<Leader>t", "<cmd>vs +term<cr>")
nmap("<Leader>e", "<cmd>NvimTreeOpen<cr>")
nmap("<C-s>", ":w<cr>")

local imap = function(lhs, rhs) vim.keymap.set("i", lhs, rhs, { silent = true }) end
imap("<C-s>", "<esc>:w<cr>i<Right>")

-- Basic settings
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


