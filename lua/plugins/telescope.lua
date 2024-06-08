local map = require("util.map")

return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").setup {
                defaults = {
                    sorting_strategy = "ascending",
                    layout_config = {
                        prompt_position = "top"
                    },
                },
                extensions = {
                    file_browser = {
                        display_stat = {
                            date = true,
                            size = true,
                        },
                        grouped = true,
                        hide_parent_dir = true,
                        hijack_netrw = true,
                    },
                }, 
            }

        end,
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").load_extension("file_browser")
            map.n("<leader>e", "<cmd>:Telescope file_browser<cr>")
        end,
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            require("telescope").load_extension("ui-select")
        end,
    },
    {
        'nvim-telescope/telescope-project.nvim',
        dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-telescope/telescope-file-browser.nvim' },
        config = function()
            require("telescope").load_extension("project")
            map.n("<leader>p", "<cmd>:Telescope project<cr>")
        end
    },
    {
        'nvim-telescope/telescope-media-files.nvim',
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = function() 
            require("telescope").load_extension("media_files")
        end
    },
 }
