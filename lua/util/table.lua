local M = {}

function M.keys(tabl)
    local keys = {}
    for key,_ in pairs(tabl) do
        keys:insert(key)
    end
    return keys
end

return M
