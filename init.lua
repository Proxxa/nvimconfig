package.path = "/home/yorip/.config/nvim/?.lua;/home/yorip/.config/nvim/lua/;" .. package.path

require("lazyfile")

-- Include configuration
require("config")

require("scripts")

-- Lazy automatically loads everything from lua/plugins
require("lazy").setup("plugins")



