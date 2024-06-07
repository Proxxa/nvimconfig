return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").setup {
                extensions = {
                    file_browser = {
                        display_stat = {
                            date = true,
                            size = true,
                        },
                        hide_parent_dir = true,
                        hijack_netrw = true,
                    },
                }, 
            }

        end,
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").load_extension("file_browser")
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require("telescope").load_extension("ui-select")
            require("util.map").n("<leader>e", "<cmd>:Telescope file_browser<cr>")
        end,
   }
 }
