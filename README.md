# Kinda nvim

A beautiful, dark and light Neovim colorscheme inspired by the default Neovim colorscheme, with enhanced support for LSP and Tree-sitter.

**Features:**
- Elegant dark and light themes
- Seamless integration with LSP and Tree-sitter for syntax highlighting
- Carefully crafted color palette for readability and aesthetics
- Support for popular Neovim plugins

## Screenshots

### Dark Theme
<img width="800" alt="Dark Theme" src="https://github.com/user-attachments/assets/d503fc92-bdfc-49c5-bc7e-16b606d14f9c" />

### Light Theme
<img width="800" alt="Light Theme" src="https://github.com/user-attachments/assets/b81d8af8-2a51-4728-9b80-5bfbe7044cb2" />

## Supported Plugins

- [blink.cmp](https://github.com/saghen/blink.cmp)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [oil.nvim](https://github.com/stevearc/oil.nvim)

## Installation

### lazy.nvim
```lua
{
  "strash/kinda_nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme kinda_nvim")
  end
}
```

### packer.nvim
```lua
use {
  "strash/kinda_nvim",
  config = function()
    vim.cmd("colorscheme kinda_nvim")
  end
}
```

## Configuration

To switch between dark and light themes, set the background option:
```lua
vim.o.background = "dark" -- or "light"
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

Distributed under the MIT License. See [LICENSE](https://github.com/strash/kinda_nvim/blob/main/LICENSE) for more information.

