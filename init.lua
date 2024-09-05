vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'dalton.options'

require 'dalton.keymaps'

require 'config.lazy' -- Init Lazy.nvim and load plugins. Should be done after setting leader

-- vim.cmd.colorscheme 'catppuccin'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
