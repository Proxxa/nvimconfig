---@diagnostic disable: undefined-global
return {
    'micangl/cmp-vimtex',
    dependencies = {
        'lervag/vimtex',
        'hrsh7th/nvim-cmp',
    },
    lazy = false,
    config = function()
        vim.g.vimtex_syntax_enabled = 0

        vim.g.vimtex_complete_enabled = 1
        vim.g.vimtex_compelete_close_braces = 1

        vim.g.vimtex_view_general_viewer = "okular"
        vim.g.vimtex_view_general_options = "--unique file:@pdf\\#src:@line@tex"

        local cmp = require("cmp")
        cmp.setup.filetype("tex", {
            sources = {
                { name = "vimtex" },
                { name = "buffer" },
            },
        })
    end
}
