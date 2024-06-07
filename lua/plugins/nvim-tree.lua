-- nvimtree, a file tree for nvim
return {
    { 
        "nvim-tree/nvim-tree.lua",
        config = function()
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

             -- nvim-tree
             vim.g.loaded_netrw = 1
             vim.g.loaded_netrwPlugin = 1
             vim.opt.termguicolors = true

         end
    },
    "nvim-tree/nvim-web-devicons",
}
