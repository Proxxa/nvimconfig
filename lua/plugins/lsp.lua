return {
    'neovim/nvim-lspconfig',
    config = function()
        local lspc = require"lspconfig"
        lspc.clangd.setup{
            init_options = {
                fallbackFlags = { "--std=c++20" },
            },
        }

        lspc.rust_analyzer.setup {
            settings = {
                ["rust_analyzer"] = {
                    cargo = {
                        allFeatures = true,
                    },
                },
            },
        }
    end,
}
