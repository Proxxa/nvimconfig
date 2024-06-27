local config_path = vim.fn.stdpath("config")
package.path = config_path .. "/?.lua;" .. config_path .. "/lua/;" .. package.path

require("lazy-nvim")

require("config")
require("scripts")

-- Lazy automatically loads everything from lua/plugins
require("lazy").setup("plugins")
