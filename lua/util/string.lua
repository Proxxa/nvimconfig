local M = {}

function M.trim(str) return string.gsub(str, '^%s*(.-)%s*$', '%1') end

return M
