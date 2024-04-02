require("nvim-tree").setup({
    actions = {
        open_file = {
            quit_on_open = true,
        },
    },
    view = {
        width = 30,
    },
    filters = {
        dotfiles = true,
    },
})

