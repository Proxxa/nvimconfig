return {
  'mrcjkb/rustaceanvim',
  version = '^9',
  init = function()
    vim.lsp.config("rust-analyzer", {
      on_attach = function(_, bufnr)
        -- Code actions, i.e. "insert explicit type" or "provide a type for the constant"
        vim.keymap.set(
          "n",
          "<leader>a",
          function()
            vim.cmd.RustLsp('codeAction')
          end,
          {
            silent = true,
            buf = bufnr,
            desc = "Code action"
          })

        -- LSP-based hover, with go-to-definition on KK
        vim.keymap.set(
          "n",
          "K",
          function()
            vim.cmd.RustLsp { "hover", "actions" }
          end,
          {
            silent = true,
            buf = bufnr,
            desc = "Hover action"
          })
      end,
    })
  end,
  lazy = false,
}
