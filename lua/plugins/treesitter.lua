return {
    { 
        'nvim-treesitter/nvim-treesitter', 
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "lua", "rust", "toml", "html", "css", 
                    "javascript", "typescript", "tsx", "svelte", },
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
        end,
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
}
