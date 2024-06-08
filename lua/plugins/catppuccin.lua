return { 
    'catppuccin/nvim', 
    name = "catppuccin", 
    priority = 1000,

    config = function()
    vim.o.background = "dark"
        require("catppuccin").setup({
            flavor = "macchiato"
        })
        vim.cmd([[colorscheme catppuccin]])
    end
}
