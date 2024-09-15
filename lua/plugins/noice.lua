return {
  -- Noice: Replaces messages, cmdline, and popup menu
  -- Repo: https://github.com/folke/noice.nvim
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
    'hrsh7th/nvim-cmp',
  },
}
