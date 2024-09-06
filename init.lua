vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

require 'dalton.options'

require 'dalton.keymaps'

require 'config.lazy' -- Init Lazy.nvim and load plugins. Should be done after setting leader

require('lsp-zero').on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)

vim.cmd.colorscheme 'catppuccin'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
