-- All of this is taken directly from https://lazy.folke.io/installation
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Options

vim.opt.mouse = 'a' -- Enable mouse mode
vim.opt.number = true -- Show line numbers
vim.opt.showmode = false -- False since our status bar shows the mode
vim.opt.undofile = true -- Save undo history
vim.opt.scrolloff = 10 -- Minimum number of lines to keep above and below cursor
vim.opt.cursorline = true -- Show line that cursor is on

vim.opt.clipboard = 'unnamedplus' -- Sync OS and NeoVim clipboards
vim.opt.relativenumber = true -- Make line numbers relative

-- Setup `leader`s before loading lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.g.have_nerd_font = true

-- Setup lazy.nvim
require('lazy').setup {
  spec = {
    -- import your plugins
    { import = 'plugins' },
  },
  -- Configure any other settings here -- https://lazy.folke.io/configuration
  install = { colorscheme = { 'catppuccin' } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}
