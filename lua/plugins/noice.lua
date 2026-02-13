---
-- Noice: Modern UI for messages, command line, and popupmenu
--
-- Plugins:
--   Noice (folke/noice.nvim) - Replaces messages, cmdline, and popupmenu
--   nvim-notify (rcarriga/nvim-notify) - Notification backend (dependency)
--   nui.nvim (MunifTanjim/nui.nvim) - UI component library (dependency)
---
return {
  -- Noice: Replaces messages, cmdline, and popup menu
  -- Repo: https://github.com/folke/noice.nvim
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {},
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      opts = {
        background_colour = '#000000',
        merge_duplicates = true,
      },
    },
  },
}
