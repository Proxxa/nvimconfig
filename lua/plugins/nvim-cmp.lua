return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        -- snippets
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        -- Rust crates
        'saecki/crates.nvim',
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<cr>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip"  },
            }, {
                { name = "buffer" },
                { name = "crates" },
            }),
        })

        local capabilities require("cmp_nvim_lsp").default_capabilities()
        local servers = require("mason-lspconfig").get_installed_servers()
        for _,serv in ipairs(servers) do
            require("lspconfig")[serv].setup {
                capabilities = capabilities
            }
        end
    end
}
