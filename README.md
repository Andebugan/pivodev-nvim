# pivodev-nvim
Neovim configuration files for pivodev devcontainer builds

![pivoscreen](https://github.com/user-attachments/assets/1f333157-aecf-412f-8274-9c6547276f7c)

## Neovim
To update neovim configuration from repo (if installed inside container) you can simply `git pull` inside repo or use `<leader>U` keymap wich basically does the same. 

What to expect:
- [ ] development
    - [x] code writing
        - [x] sytax highlight/analysis (nvim-treesitter)
        - [x] code completions (luasnip, nvim-cmp)
        - [x] code suggestions (mason, lspconfig)
    - [x] git integration (gitsigns, vim-fugitive)
    - [ ] documentation integration
    - [x] project management (telescope projects)
    - [x] docker integration
    - [ ] Markdown/LaTeX preview (live, if possible)
- [x] navigation
    - [x] file navigator (oil)
    - [x] file/dir search (telescope)
- [x] utility
    - [x] pivo screen
    - [x] custom bash line config
        - [x] git info

### Config file structure
Package structure:
- init.lua - contains neovim settings (keybindings, autocommands, package manager initialization)
- after - for scripts that must be executed after loading
- lua - package folder
    - plugins.lua - lazy file 
    - plugins - contains all installed packages configurations
        - base - global neovim plugins
        - config - contains language configuration file for simple controll, if value is true - tools are installed automatically
        - lang - language configuration (lsp, mason, nvim-dap)

### Packages
Package manager - [*lazy.nvim*](https://github.com/folke/lazy.nvim), as most stable and maintained (packer.nvim unmaintained since august 2023)

Base neovim installation:
+ filesystem navigation:
  + telescope.nvim - pickers, sorters and previewers, [github](https://github.com/nvim-telescope/telescope.nvim)
    + plenary.nvim - dependency of telescope, [github](https://github.com/nvim-lua/plenary.nvim)
    + telescope-project.nvim - project management with telescope, [github](https://github.com/nvim-telescope/telescope-project.nvim)
    + telescope-ui-select.nvim - sets vim.ui.select to telescope, [github](https://github.com/nvim-telescope/telescope-ui-select.nvim)
  + oil.nvim - allows to manage files via neovim buffer, [github](https://github.com/stevearc/oil.nvim) (neotree exists as viable alternative but personaly I find oil more "natura" to use)
+ syntax:
  + nvim-treesitter - general syntax parser, [github](https://github.com/nvim-treesitter/nvim-treesitter)
+ completion and snippets:
  + LuaSnip.nvim - snippet engine for neovim, [github](https://github.com/L3MON4D3/LuaSnip)
  + nvim-cmp - neovim completion plugin, written in lua, [github](https://github.com/hrsh7th/nvim-cmp)
+ git:
  + vim-fugitive - git integration, [github](https://github.com/tpope/vim-fugitive)
  + gitsigns.nvim - git decorations, [github](https://github.com/lewis6991/gitsigns.nvim)
+ misc code tools:
  + vim-commentary - comment actions, [github](https://github.com/tpope/vim-commentary)
  + vim-surround - parentness manager, [github](https://github.com/tpope/vim-surround)
+ appearance:
  + alpha-nvim - neovim greeter, [github](https://github.com/goolord/alpha-nvim)
  + lualine.nvim - custom neovim status line, [github](https://github.com/nvim-lualine/lualine.nvim)
  + kaganawa.nvim - personal colorscheme choice, [github](https://github.com/rebelot/kanagawa.nvim)

lsp, debugging and formatting, based on lspconfig and mason because (coc is good too tho but native is my personal choice):
+ nvim-lspconfig - collection of configuration for Nvim's LSP client, [github](https://github.com/neovim/nvim-lspconfig)
+ mason-lspconfig.nvim - bridge lspconfig and mason, [github](https://github.com/williamboman/mason-lspconfig.nvim)
+ mason.nvim - external tool manager (LSP servers, etc.), [github](https://github.com/williamboman/mason.nvim?tab=readme-ov-file)
+ nvim-dap - debug adapter protocol (debugging support), [github](https://github.com/mfussenegger/nvim-dap), [adapter configuraions](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#python)
+ nvim-dap-ui - debugger ui, [github](https://github.com/rcarriga/nvim-dap-ui)

For testing - neotest and it's adapters, [github](https://github.com/nvim-neotest/neotest)

