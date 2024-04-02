require("lazyfile")

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

-- Set up plugins
require("nvtree")       -- nvim-tree (file tree)
require("masonconf")    -- Mason
require("color")        -- Color scheme
require("line")         -- lualine
require("rusty")        -- rust-tools

-- Use nu
vim.opt.shell = "nu"

-- Bindings
vim.g.mapleader = " "

vim.keymap.set("n", "<Leader>t", "<cmd>vs +term<cr>")
vim.keymap.set("n", "<Leader>e", "<cmd>NvimTreeOpen<cr>")

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

-- configure mason (basic)



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
