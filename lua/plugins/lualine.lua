return { 
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup {
            options = {
                icons_enabled = false,
                theme = "auto",
                component_separators = " ",
                section_separators = { left = "🭬", right = "🭮" },
            },
            sections = {
                lualine_a = {
                    { 'mode', fmt = function(str) return str:sub(1,1) end }
                },
                lualine_b = {
                    { 'branch' }
                },
            }
        }
    end
}
