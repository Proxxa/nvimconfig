# Yori's Neovim Config

Lovingly maintained by Yori <yori@yorip.dev>.

## Installation

If you wanted to install this permanently, simply clone to your neovim config
directory. Please back up your current directory if you have one before doing
this.

```sh
git clone https://github.com/Proxxa/nvimconfig.git ~/.config/nvim
```

## Requirements

For Rust support, you need to have `rust-analyzer` installed.
```sh
rustup component add rust-analyzer
```

## Keymaps

### Leaders
- `<leader>` is space
- `<localleader>` is `\`

### Global Keymaps
- `<leader>t` splits the window vertically and opens a terminal.

### Completions
- `<C-b>`/`<C-f>` scroll documentation
- `<C-Space>` completes a mapping, supposedly
- `<C-e>` abort completion
- `<CR>` confirm a completion, even if none is explicitly selected.

### Snippets
- `<C-K>` expands a snippet. Usually isn't needed, since [nvim-cmp] will offer
  to expand snippets for you.
- `<C-L>` jumps to the next argument in the snippet.
- `<C-J>` jumps to the previous argument in the snippet.
- `<C-E>` cycles your current choice in an enumerated snippet argument.

### Rust
- `K` hover actions are managed by [rustaceanvim], actions from rust-analyzer.
- `<leader>a` code actions, such as inlining or generating type aliases,
  handled by [rustaceanvim]


[rustaceanvim]: https://github.com/mrcjkb/rustaceanvim
[nvim-cmp]: https://github.com/hrsh7th/nvim-cmp
