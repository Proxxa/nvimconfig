return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("neogit").setup {
            kind = "auto",
        }
        local map = require("util.map")
        map.n("<Leader>g", "<cmd>Neogit<cr>")
    end
}
