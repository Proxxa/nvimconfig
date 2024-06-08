return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- Table of custom tab names for tabline
        vim.g.__lualine_tab_names = {}
        
        -- Command for Renaming
        vim.api.nvim_create_user_command(
            "TabRename",
            function(data)
                local table_copy = vim.g.__lualine_tab_names
                local tabnr = (data.count ~= -1 and data.count) or vim.fn.tabpagenr()
                local input = vim.trim(data.args)

                table_copy[tabnr] = data.args ~= "" and data.args or nil

                vim.g.__lualine_tab_names = table_copy
            end,
            {
                desc =  "A command for renaming tabs.\n\n" ..

                        "Creates/removes an entry in a table used to customize the display name\n" ..
                        "of a tab in the tabline. If a count is provided, the command modifies the name\n" ..
                        "of that tab. If no name is provided, the command resets the name.",
                nargs = "?",
                force = true,
            }
        )

        -- Autocmd for moving tab names around after a tab closes
        vim.api.nvim_create_autocmd("TabClosed", {
            callback = function(ev)
                local idx = tonumber(ev.file)
                local table_copy = vim.g.__lualine_tab_names

                table_copy[idx] = nil
                for k,v in pairs(table_copy) do
                    if k > idx then
                        table_copy[k-1] = v
                        table_copy[k+1] = nil
                    end
                end

                vim.g.__lualine_tab_names = table_copy
            end
        })

        require("lualine").setup {
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = " ",
                section_separators = { left = "🭬", right = "🭮" },
                disabled_filetypes = {
                    tabline = {},
                },
                refresh = {
                    statusline  = 1000,
                    tabline     = 5000,
                },
            },
            sections = {
                lualine_a = {
                    { "mode", fmt = function(str) return str:sub(1,1) end }
                },

                lualine_b = {
                    { "branch" }
                },

                lualine_x = {
                    {
                        "filetype",
                        icon = { "", align = "right" },
                        fmt = function(str) return str:upper() end
                    },
                }
            },
            tabline = {
                lualine_a = {
                    {
                        "tabs",
                        mode = 3,
                        use_mode_colors = true,

                        -- By default, the mark is on the left and connected to the number.
                        -- Because of this, I've decided to handle it in the formatting function.
                        show_modified_status = false,
                        symbols = {
                            -- This is never used, but it's the thought that counts.
                            modified = "*",
                        },

                        fmt = function(name, ctx)
                            local tabnr = ctx.tabnr
                            local custom_name = vim.g.__lualine_tab_names[tabnr]
                            -- Account for vim.NIL
                            custom_name = (custom_name ~= vim.NIL) and custom_name or nil
                            local disp_name = ""
                             
                            local buflist = vim.fn.tabpagebuflist(tabnr)
                            local winnr = vim.fn.tabpagewinnr(tabnr)
                            local bufnr = buflist[winnr]

                            -- nil is false.
                            if custom_name then
                                disp_name = custom_name    
                            else                                          
                                -- Never use the default name for terminals
                                if vim.fn.getbufvar(bufnr, "&buftype") == "terminal" then
                                    disp_name = "Terminal"
                                else
                                    disp_name = name
                                end
                            end
                            
                            local mod = vim.fn.getbufvar(bufnr, "&mod")
                            return disp_name .. (mod == 1 and "*" or "")
                        end,
                    }, 
                },
            },
        }
    end,
}
