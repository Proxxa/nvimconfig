return {
  "mason-org/mason-lspconfig.nvim",
  init = function(_)
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = vim.tbl_deep_extend('force', {}, {
          runtime = { version = 'LuaJIT', path = { 'lua/?.lua', 'lua/?/init.lua', }, },
          -- Make the server aware of Neovim runtime files
          workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME, vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1], }, },
        }),
      }
    })
  end,
  opts = {
    automatic_enable = {
      exclude = { --[["lua_ls",]] }
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
