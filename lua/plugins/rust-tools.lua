---@diagnostic disable: undefined-global
return {
    {
        'simrat39/rust-tools.nvim',
        config = function()
            local rt = require("rust-tools")

            rt.setup({
                server = {
                    on_attach = function(_, bufnr)
                        vim.keymap.set("n", rt.hover_actions.hover_actions, { buffer = bufnr })
                        vim.keymap.set("n", rt.code_action_group.code_action_group, { buffer = bufnr })
                    end
                },
            })
        end,
    },
    {
        'saecki/crates.nvim',
        tag = "stable",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup {
                completion = {
                    cmp = {
                        enabled = true,
                    },
                },
            }
        end,
    }
}
