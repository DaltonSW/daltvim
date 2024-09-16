return {
  -- Noice: Replaces messages, cmdline, and popup menu
  -- Repo: https://github.com/folke/noice.nvim
  'folke/noice.nvim',
  version = '4.4.7', -- HACK: Needing to force this version to fix the cursor blinking issue
  event = 'VeryLazy',
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
    { 'rcarriga/nvim-notify', opts = { background_colour = '#000000' } },
    'hrsh7th/nvim-cmp',
  },
}
