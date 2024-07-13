---@diagnostic disable: undefined-global
local M = {}

-- Normal Mode
function M.n(lhs, rhs) vim.keymap.set("n", lhs, rhs, { silent = true }) end

-- Insert Mode
function M.i(lhs, rhs) vim.keymap.set("i", lhs, rhs, { silent = true }) end

-- Select Mode
function M.s(lhs, rhs) vim.keymap.set("s", lhs, rhs, { silent = true }) end

-- Select and Insert
function M.is(lhs, rhs) vim.keymap.set({"i", "s"}, lhs, rhs, { silent = true }) end
function M.si(lhs, rhs) vim.keymap.set({"i", "s"}, lhs, rhs, { silent = true }) end

return M
