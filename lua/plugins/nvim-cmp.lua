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
                ["<cr>"] = cmp.mapping({
                    i = function(fallback)
                        if cmp.visible() and cmp.get_active_entry() then
                            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                        else
                            fallback()
                        end
                    end,
                    s = cmp.mapping.confirm({ select = true }),
                    c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                }),
                ["<F11>"] = cmp.mapping(cmp.mapping.open_docs, { "i", "s" }),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip"  },
            }, {
                { name = "vimtex" },
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
