local M = {}

function M.nil() end

function M.confirm_action(confirm_prompt, callback)
    vim.ui.select({ 'yes', 'no' }, {
        prompt = confirm_prompt,
        format_item = function(item)
            return '(' .. string.sub(item, 1, 1) .. ')' .. string.sub(item, 2, -1)
        end
    },  function(choice)    
            if choice == nil then
                print("Cancelled.")
                return
            end
            first_char = string.lower(string.sub(choice, 1, 1))
            if first_char == 'y' then callback() else print('Cancelled.') end
        end)
end

function M.select(promp, options)
    vim.ui.select(options:keys(),
        { prompt = promp },
        function(choice)
            for k,v in pairs(options) do
                if choice == k then
                    return v()
                end
            end
        end)
end

return M
