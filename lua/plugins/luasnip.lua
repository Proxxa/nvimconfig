---@diagnostic disable: undefined-global
return {
    "L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    config = function()
        local ls = require("luasnip")
        local snippet_dir = vim.fn.stdpath("config") .. "/snips"
        require("luasnip.loaders.from_lua").load({ paths = snippet_dir })

        local map = require("util.map")
        map.i("<C-K>", function() ls.expand() end)
        map.is("<C-L>", function() ls.jump( 1) end)
        map.is("<C-J>", function() ls.jump(-1) end)
        map.is("<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end)
    end
}
