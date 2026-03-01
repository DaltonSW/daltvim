# DaltVim

!["DaltVim Dashboard"](./assets/dashboard.jpg)

## Plugins Installed

| Plugin | Description | Config File |
| - | - | - |
| [Catppuccin](https://github.com/catppuccin/nvim) | Pastel color theme with integrations for many plugins | `plugins/ui.lua` |
| [Conform](https://github.com/stevearc/conform.nvim) | Automatic formatting on save, with per-language formatter configuration | `plugins/editor.lua` |
| [Floating Help](https://github.com/nil70n/floating-help) | Opens `:help` windows as floating popups instead of splits | `plugins/ui.lua` |
| [Mason](https://github.com/mason-org/mason.nvim) | Package manager for LSP servers, formatters, linters, and DAP servers | `plugins/lsp.lua` |
| [Mason-LSPConfig](https://github.com/mason-org/mason-lspconfig.nvim) | Bridges Mason and nvim-lspconfig for automatic LSP server setup | `plugins/lsp.lua` |
| [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) | Tree-based browser for files, git status, and document symbols | `plugins/navigation.lua` |
| [Noice](https://github.com/folke/noice.nvim) | Replaces the command line, messages, and popupmenu with modern UI | `plugins/ui.lua` |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Auto-completion engine with LSP integration | `plugins/lsp.lua` |
| [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) | Automatically close and rename paired HTML/JSX tags | `plugins/editor.lua` |
| [Render Markdown](https://github.com/MeanderingProgrammer/render-markdown.nvim) | Pretty inline rendering of markdown with headers, lists, and code blocks | `plugins/editor.lua` |
| [Snacks](https://github.com/folke/snacks.nvim) | Dashboard, image viewer, and quickfile opener | `plugins/mini_snacks.lua` |
| [Telescope](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, buffers, grep, references, symbols, and more | `plugins/navigation.lua` |
| [ToggleTerm](https://github.com/akinsho/toggleterm.nvim) | Floating terminal toggled with a keymap | `plugins/editor.lua` |
| [Todo Comments](https://github.com/folke/todo-comments.nvim) | Highlight and list TODO-style keywords in comments | `plugins/navigation.lua` |
| [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Incremental parsing for syntax highlighting, indentation, and text objects | `plugins/treesitter.lua` |
| [Undotree](https://github.com/jiaoshijie/undotree) | Visual tree-based undo history for branching edits | `plugins/editor.lua` |
| [Vim Sleuth](https://github.com/tpope/vim-sleuth) | Auto-detects tabstop, shiftwidth, and expandtab from file contents | `plugins/editor.lua` |
| [Which Key](https://github.com/folke/which-key.nvim) | Shows available keybindings as you type leader/chord sequences | `plugins/editor.lua` |

### Mini

[mini.nvim](https://github.com/echasnovski/mini.nvim) is a collection of small, standalone plugins. Config file: `plugins/mini_snacks.lua`

| Module | Description |
| - | - |
| `mini.icons` | Glyph and icon provider used by other plugins (Neo-tree, etc.) |
| `mini.indentscope` | Visual indent scope indicator |
| `mini.jump` | Enhanced `f`/`t` motions with repeat via `;` |
| `mini.jump2d` | Jump to any visible location on screen (default keymap: `<CR>`) |
| `mini.move` | Move lines or selections directionally without cut/paste (`<C-M-hjkl>`) |
| `mini.pairs` | Auto-pairing for brackets, quotes, and parentheses |
| `mini.statusline` | Lightweight statusline |
| `mini.surround` | Add, delete, or replace surrounding pairs (e.g. `sa`, `sd`, `sr`) |

## Keymaps

### General

| Keymap | Mode | Description |
| - | - | - |
| `<Space>` | n | Leader key |
| `<Esc>` | n | Clear search highlight |
| `<C-s>` | i, x, n, s | Save file |
| `<C-h/j/k/l>` | n | Move focus between split windows |
| `n` / `N` | n, x, o | Next/previous search result (centered) |

### Terminal

| Keymap | Mode | Description |
| - | - | - |
| `<leader>tt` | n | Toggle floating terminal |
| `<Esc><Esc>` | t | Toggle terminal window |
| `<Esc>` | t | Exit terminal mode (return to normal mode) |

### LSP (active when a language server is attached)

Neovim 0.11+ provides these natively:

| Keymap | Description |
| - | - |
| `K` | Hover documentation |
| `grn` | Rename symbol |
| `grr` | Find references |
| `gra` | Code action |
| `gri` | Go to implementation |
| `gO` | Document symbols |

Custom LSP keymaps (set in `plugins/lsp.lua`):

| Keymap | Description |
| - | - |
| `gd` | Go to definition (Telescope) |
| `gD` | Go to declaration (Telescope) |
| `go` | Go to type definition (Telescope) |
| `gs` | Signature help |
| `<F2>` | Rename |
| `<F3>` | Format (async) |

### Completion (nvim-cmp)

| Keymap | Description |
| - | - |
| `<C-n>` | Next completion item |
| `<C-p>` | Previous completion item |
| `<C-y>` | Confirm selection |
| `<C-Space>` | Trigger completion |
| `<C-e>` | Abort completion |
| `<C-u>` / `<C-d>` | Scroll documentation up/down |

### Leader Key Groups

| Prefix | Group | Key Bindings |
| - | - | - |
| `<leader>f` | Find | `fb` buffer, `fd` diagnostics, `ff` files, `fg` grep, `fr` references, `fs` symbols, `ft` TODOs |
| `<leader>n` | Neo-tree | `nc` close, `nf` files, `ng` git status, `ns` symbols |
| `<leader>t` | Terminal | `tt` toggle floating terminal |
| `<leader>u` | Utilities | Undotree toggle |
| `<leader>?` | | Local buffer keymaps (Which Key) |

### Treesitter

| Keymap | Mode | Description |
| - | - | - |
| `<C-Space>` | n | Start/increment selection |
| `<BS>` | x | Decrement selection |
| `]f` / `[f` | n | Next/previous function start |
| `]F` / `[F` | n | Next/previous function end |
| `]c` / `[c` | n | Next/previous class start |
| `]C` / `[C` | n | Next/previous class end |
| `]a` / `[a` | n | Next/previous parameter |

## Config Structure

```
~/.config/nvim/
├── init.lua                     # Entry point: leader keys, load order, colorscheme
├── lsp/
│   └── gdscript.lua             # GDScript LSP server config (Neovim 0.11 native)
├── lua/
│   ├── config/
│   │   ├── options.lua          # Neovim options (numbers, clipboard, etc.)
│   │   ├── keymaps.lua          # Core keymaps and yank highlight autocmd
│   │   ├── lazynvim.lua         # Lazy.nvim bootstrap and plugin loader
│   │   └── godot.lua            # Godot LSP enable and pipe server setup
│   └── plugins/
│       ├── dashboard.lua        # Dashboard startup screen (disabled)
│       ├── editor.lua           # Vim Sleuth, Conform, ts-autotag, Render Markdown, Undotree, ToggleTerm, Which Key
│       ├── lsp.lua              # Mason, Mason-LSPConfig, nvim-cmp, LSP keymaps
│       ├── mini_snacks.lua      # mini.nvim modules + Snacks (dashboard, image, quickfile)
│       ├── navigation.lua       # Telescope, Neo-tree, Todo Comments
│       ├── treesitter.lua       # Treesitter syntax parsing + VHS/Go template support
│       └── ui.lua               # Catppuccin theme, Noice, nvim-notify, Floating Help
├── notes/
│   └── plugin-template.lua      # Template for new plugin specs
└── lazy-lock.json               # Plugin version lock file
```

## Problems I've Discovered

### Pending

- Open link under cursor in browser
    - I tried `url-open` but it was unable to launch URLs inside of WSL properly for me

### Solved

- Way to jump into config from Dashboard
    - Using `Telescope` and pointing it to nvim config folder
- A way to interact with files and folders that isn't netrw
    - `Neotree` for full-dir visualizing, and adding/renaming/moving/etc
    - `Telescope` for moving quickly between files and searching for them (among other things)
- No autocompleting braces/parens
    - `mini.pairs`
- How can I wrap existing text with parents/quotes/etc? (ie "string" -> { "string" } )
    - `mini.surround`
- Jumping to stuff in view
    - `mini.jump2d` (jump to any visible location, default `<CR>`)

## Things To Do

### General Considerations

- Consider replacing Neotree with mini.files + fugitive, it looks like it's a bit cleaner for what I want

### Configuration of Installed Plugins

- Configure `mini.statusline` sections if needed

### Concepts To Investigate Without Installed Plugins

- [ ] Testing
- [ ] Folding
- [ ] Debugging
- [ ] AI...?
