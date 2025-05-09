vim.opt.termguicolors = true -- Ensure 24-bit color is enabled

vim.opt.number = true -- Enable line numbers by default
vim.opt.relativenumber = true -- Use relative line numbers

-- vim.opt.mouse = 'a' -- Enable the mouse

vim.opt.showmode = false -- Can be disabled if you get a status bar or something

vim.opt.clipboard = 'unnamedplus' -- Sync OS and Neovim clipboard

-- Enable break indent
vim.opt.breakindent = true

vim.opt.undofile = true -- Save undo history

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
-- vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
