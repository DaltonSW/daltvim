-- Install `lazy.nvim` plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Configure and install plugins
require('lazy').setup {
  'LazyVim/LazyVim',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  { 'MaximilianLloyd/ascii.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },

  checker = {
    enabled = true,
    notify = true,
  },

  require 'dalton.plugins.Coding',
  require 'dalton.plugins.Debugging',
  require 'dalton.plugins.Editor',
  require 'dalton.plugins.Formatting',
  require 'dalton.plugins.Go',
  require 'dalton.plugins.LSP',
  require 'dalton.plugins.Mini',
  require 'dalton.plugins.Testing',
  require 'dalton.plugins.Treesitter',
  require 'dalton.plugins.UI',
  require 'dalton.plugins.Utils',

  require 'dalton.plugins.neotree',
  require 'dalton.plugins.telescope',
  require 'dalton.plugins.undotree',
}
