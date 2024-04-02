-- lazy.nvim boilerplate
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Configure lazy packages
require("lazy").setup({
    -- gruvbox theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000, },

    -- Pointless
    "andweeb/presence.nvim",
   
    -- nvimtree, a file tree for nvim
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons",

    -- lspconfig
    "neovim/nvim-lspconfig",

    -- mason
    { "williamboman/mason.nvim" },
    "williamboman/mason-lspconfig.nvim",

    -- treesitter highlighting
    { "nvim-treesitter/nvim-treesitter", build=":TSUpdate" },
    "nvim-treesitter/nvim-treesitter-textobjects",

    -- rusty
    "simrat39/rust-tools.nvim",

    -- improve line
    "nvim-lualine/lualine.nvim",


}, opts)

-- Use nu
vim.opt.shell = "nu"

-- Bindings
vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>t", "<cmd>vs +term<cr>")

-- Color scheme
vim.o.background = "dark"
require("catppuccin").setup({
    flavor = "macchiato"
})
vim.cmd([[colorscheme catppuccin]])

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
require("nvim-tree").setup({
    view = {
        width = 30,
    },
    filters = {
        dotfiles = true,
    },
})


-- configure mason (basic)
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup()

require("lualine").setup {
    options = {
        icons_enabled = false,
        theme = "auto",
        component_separators = " ",
        section_separators = { left = "🭬", right = "🭮" },
    },
    sections = {
        lualine_a = {
            { 'mode', fmt = function(str) return str:sub(1,1) end }
        },
        lualine_b = {
            { 'branch' }
        },
    }
}

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr) 
            vim.keymap.set("n", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", rt.code_action_group.code_action_group, { buffer = bufnr })
        end
    },
})

require("nvim-treesitter.configs").setup {
    ensure_installed = { "lua", "rust", "toml", },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
}


require("presence").setup({
    auto_update = true,
    main_image = "neovim",
    neovim_image_text = "Yes, I'm pretentious.",
    buttons = {{ label = "GitHub", url = "https://github.com/Proxxa"}},
    show_time = true,

    editing_text = "%s",
    git_commit_text = "Committing %s",
    plugin_manager_text = "Managing %s",
    reading_text = "Viewing %s",
    workspace_text = "Working on %s",

})
