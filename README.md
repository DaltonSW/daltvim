# DaltVim 2.0

It's in progress :)

## Problems I've Discovered

### Pending

- No autocompleting braces/parens
- No way to interact with terminal inside of Neovim for quick stuff
- Open link under cursor in browser

### Solved

- Way to jump into config from Dashboard
    - Using Telescope and pointing it to nvim config folder
- A way to interact with files and folders that isn't netrw
    - Neotree for full-dir visualizing, and adding/renaming/moving/etc
    - Telescope for moving quickly between files and searching for them (among other things)

## Things To Do

- Install Mason things
- Configure Telescope after installing
- Link Telescope into Dashboard after installing
- Configure `lualine`. Remove some stuff and see what can be added (like I don't need file encoding type or Tux in my bar)

## Plugins

### Installed

- [x] Theme
- [x] Dashboard
- [x] TreeSitter
- [x] LSP (LSP Zero + Mason)
- [x] TODO Comments
- [x] Status Bar (lualine)
- [x] Formatting
- [x] WhichKey
- [x] UndoTree
- [x] Telescope
- [x] NeoTree
- [x] Trouble
- [x] Noice

### Specific Plugins to Install

- [ ] VimFugitive (git stuff)
- [ ] Mini
    - https://github.com/echasnovski/mini.nvim?tab=readme-ov-file#modules

### Known Concepts, No Specific Plugin Known

- [ ] Testing
- [ ] Folding
- [ ] Jumping to stuff in view

### Potential Concepts to Investigate

- [ ] Debugging
- [ ] AI?

## Keymap Categories

- File Nav
- Searching (& Replacing)
- Window Management
- Version Control
- Go To ...
- Workspace / Project Management
- Text Manipulation

## Order Of Things Done

- Installed `catppuccin`
- Installed `treesitter`
- Installed and customized `dashboard-nvim`
- Installed `lsp-zero` and `mason`
- Added Mason to Dashboard
- Installed `todo-comments` ahead of schedule cuz I really missed them
- Installed `vim-sleuth`, holy shit I didn't realize how nice the auto tab-width detection is
- Installed `lualine` ahead of schedule because I found myself glancing to where the status bar should've been too often
- Installed `conform`
- Went through Mason and installed formatters and LSPs for Go, Python, Markdown, and Lua
- Installed `which-key`
- Installed `undotree`
- Installed `telescope`
- Installed `neo-tree`
- Installed `trouble`
- Installed `noice`
