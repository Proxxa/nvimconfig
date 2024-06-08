return {
    {
        'luckasRanarison/tailwind-tools.nvim',
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {} -- your configuration
    },
    {
        'razak17/tailwind-fold.nvim',
        opts = {},
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        ft = { 'html', 'svelte', 'typescriptreact', },
    },
}
