---@diagnostic disable: undefined-global
local M = {}

-- Normal Mode
function M.n(lhs, rhs) vim.keymap.set("n", lhs, rhs, { silent = true }) end

-- Insert Mode
function M.i(lhs, rhs) vim.keymap.set("i", lhs, rhs, { silent = true }) end


return M
