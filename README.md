# DaltVim 2.0

!["DaltVim Dashboard"](./assets/dashboard.jpg")

## Plugins Installed

| Plugin | Description |
| - | - |
| Catppuccin | Pretty theme |
| Comment.nvim | Makes commenting lines and blocks easier, and integrates with repeats and numbers better |
| Conform | Automatic formatting, integrating various formatters for customizable languages |
| Dashboard | Startup screen that's pretty and functional |
| Highlight Colors | Actively color hexcodes inside of nvim |
| LSP Zero | Bundled LSP plugins and settings for smoother setup. Not required, but much simpler |
| Lualine | More informative and prettier statusline |
| Mason | In-neovim tool for managing LSPs, debuggers, formatters, and more |
| nvim-cmp | Auto-completion and integration with LSPs |
| Neotree | Tree-based file browser, though can display git status and document symbols too |
| Noice | Notifications and command line visual enhancements |
| Octo | GitHub repo interaction (issues, PRs, etc.) |
| Project | System-wide project tracker for quick jumping between git repos |
| Render Markdown | Makes markdown super pretty when viewing it inside of nvim |
| Telescope | Fuzzy-finding for many a thing (files, projects, symbols, errors, etc.) |
| TODO Comments | Colors various keywords in comments to call stuff out |
| Treesitter | Incremental-parsing library used for analysis and tooling |
| Trouble | Better tracking of issues, suggestions, etc. Like ToDo Comments but for LSP warnings |
| Undo Tree | Tree-like undo history, allowing for jumping around and branching your edits |
| Vim Sleuth | Auto-detect tabstops and shift widths and such |
| Which Key | Visualization of keymappings based on the currently chorded keystrokes |

### Mini

I also have `mini.nvim` installed, which is a collection of smaller standalone plugins.
There are more available, but I've gone with the following:  

| Plugin | Description |
| - | - |
| mini.animate | Smoother scrolling and cursor movement |
| mini.icons | ASCII and glyph icons for other plugins to make use of |
| mini.jump | Enables better jumping forward and backward |
| mini.move | Allows you to move lines and selections around without cutting |
| mini.pairs | Automatic pairing for quotes, brackets, etc. |
| mini.surround | Lets you surround selections with quotes, brackets, etc. |

## Problems I've Discovered

### Pending

- No way to interact with terminal inside of Neovim for quick stuff
    - A plugin like `toggleterm` looks neat, but I feel like I should look into understanding tabs/buffers more first to see if I actually need it? Not sure what the difference would be between that plugin and just a hotkey to jump between different tabs(?)
- Open link under cursor in browser
    - I tried `url-open` but it was unable to launch URLs inside of WSL properly for me

### Solved

- Way to jump into config from Dashboard
    - Using Telescope and pointing it to nvim config folder
- A way to interact with files and folders that isn't netrw
    - Neotree for full-dir visualizing, and adding/renaming/moving/etc
    - Telescope for moving quickly between files and searching for them (among other things)
- No autocompleting braces/parens
    - mini.pairs
- How can I wrap existing text with parents/quotes/etc? (ie "string" -> { "string" } )
    - mini.surround

## Things To Do

### General Considerations

- Consider replacing Neotree with mini.files, it looks like it's a beat cleaner for what I want

### Configuration of Installed Plugins

- Configure `lualine`. Remove some stuff and see what can be added (like I don't need file encoding type or Tux in my bar)

### Concepts To Investigate Without Installed Plugins

- [ ] Testing
- [ ] Folding
- [ ] Jumping to stuff in view
- [ ] Debugging
- [ ] AI?

