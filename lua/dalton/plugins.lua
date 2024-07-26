-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Configure and install plugins
require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  'HiPhish/rainbow-delimiters.nvim',
  { 'MaximilianLloyd/ascii.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  require 'dalton.plugins.alpha',
  require 'dalton.plugins.autocomp',
  require 'dalton.plugins.autofmt',
  require 'dalton.plugins.autopairs',
  require 'dalton.plugins.codeium',
  require 'dalton.plugins.debugging',
  require 'dalton.plugins.indentline',
  require 'dalton.plugins.lsp',
  require 'dalton.plugins.mini',
  require 'dalton.plugins.neotree',
  require 'dalton.plugins.telescope',
  require 'dalton.plugins.theme',
  require 'dalton.plugins.todocomments',
  require 'dalton.plugins.treesitter',
  require 'dalton.plugins.undotree',
  require 'dalton.plugins.whichkey',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
