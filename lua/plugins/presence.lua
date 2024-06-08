return { 
    'andweeb/presence.nvim',
    config = function()
        require("presence").setup({
            auto_update = true,
            main_image = "neovim",
            neovim_image_text = "Yes, I'm pretentious.",
            buttons = {{ label = "GitHub", url = "https://github.com/Proxxa"}},
            show_time = true,
        
            editing_text = "%s",
            git_commit_text = "Committing %s",
            plugin_manager_text = "Managing %s",
            reading_text = "Viewing %s",
            workspace_text = "Working on %s",
        
        })
    end
}
