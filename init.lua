vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'config.options'

require 'config.keymaps'

require 'config.lazynvim' -- Init Lazy.nvim and load plugins. Should be done after setting leader

require 'config.godot' -- LSP setup and pipe connections for Godot External Editor

vim.cmd.colorscheme 'catppuccin'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
