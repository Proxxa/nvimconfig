package.path = "/home/yorip/.config/nvim/?.lua;" .. package.path

require("plugconf.lazyfile")

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

    -- Tailwind CSS
    {
        "luckasRanarison/tailwind-tools.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {} -- your configuration
    },
    {
        'razak17/tailwind-fold.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        ft = { 'html', 'svelte', 'typescriptreact', },
    },


}, opts)

-- Set up plugins
require("plugconf.nvim-tree")       -- nvim-tree (file tree)
require("plugconf.mason")           -- Mason
require("plugconf.colorscheme")     -- Color scheme
require("plugconf.lualine")         -- lualine
require("plugconf.rust-tools")      -- rust-tools
require("plugconf.treesitter")      -- treesitter
require("plugconf.presence")        -- discord presence
-- require("plugconf.tailwind")     -- Unnecessary
require'lspconfig'.svelte.setup{}

-- Include configuration
require("config")
