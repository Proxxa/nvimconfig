-- Use nu
vim.opt.shell = "nu"

-- Bindings
vim.g.mapleader = " "

local nmap = function(lhs, rhs) vim.keymap.set("n", lhs, rhs, { silent = true }) end
nmap("<Leader>t", "<cmd>vs +term<cr>")
nmap("<Leader>e", "<cmd>NvimTreeOpen<cr>")
nmap("<C-s>", ":w<cr>")
nmap("<Leader>gpl", function()
   vim.ui.select({ 'yes', 'no' }, {
        prompt = 'Are you sure you want to run `git pull`?',
        format_item = function(item)
            return '(' .. string.sub(item, 1, 1) .. ')' .. string.sub(item, 2, -1)
        end
    },  function(choice)
            
            first_char = string.lower(string.sub(choice, 1, 1))
            if first_char == 'y' then
                print('Pulling.')
                local sout = os.execute('git pull')
                print(sout)
            else 
                print('Cancelled.')
            end
        end)
end)

local imap = function(lhs, rhs) vim.keymap.set("i", lhs, rhs, { silent = true }) end
imap("<C-s>", "<esc>:w<cr>i<Right>")

-- Basic settings
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true


