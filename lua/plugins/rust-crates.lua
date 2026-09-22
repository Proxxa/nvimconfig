return {
  'saecki/crates.nvim',
  tag = "stable",
  event = { "BufRead Cargo.toml" },
  opts = {
    completion = {
      cmp = {
        enabled = true,
      },
    },
  },
}
