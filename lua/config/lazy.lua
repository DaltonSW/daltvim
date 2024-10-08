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

-- Setup lazy.nvim
require('lazy').setup {
  -- Source any *.lua file in the plugins directory (or from plugins.lua)
  spec = {
    { import = 'plugins' },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- https://lazy.folke.io/configuration

  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'catppuccin' } },

  -- automatically check for plugin updates
  checker = { enabled = true, notify = true },
  change_detection = { notify = false },

  -- add border to lazy popup
  ui = {
    border = 'rounded',
    title = 'Lazy Plugin Manager',
  },
}
