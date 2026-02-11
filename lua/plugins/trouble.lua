---
-- Trouble: Pretty diagnostic, quickfix, and location list viewer
--
-- Plugins:
--   Trouble (folke/trouble.nvim) - Enhanced list viewer for diagnostics and more
--
-- Keymaps: <leader>xx diagnostics, <leader>xl location list, <leader>xq quickfix
---
return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble', -- LazyLoad on command
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xl',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
  },
}
