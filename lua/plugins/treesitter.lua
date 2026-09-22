return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  init = function()
    -- Build set of available parsers
    local availables = {}
    for _, avail in ipairs(require 'nvim-treesitter'.get_available()) do availables[avail] = true end
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        local ft = vim.bo[ev.buf].filetype
        -- Install and enable parser
        if availables[ft] then
          require 'nvim-treesitter'.install({ ft }):await(function()
            vim.treesitter.start()
          end)
        end
      end,
    })
  end,
  build = ':TSUpdate'
}
