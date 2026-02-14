---
-- UI: Theme, notifications, and visual chrome
--
-- Plugins:
--   Catppuccin (catppuccin/nvim) - Pastel color theme with plugin integrations
--   Noice (folke/noice.nvim) - Replaces messages, cmdline, and popupmenu
--   nvim-notify (rcarriga/nvim-notify) - Notification backend (dependency)
--   nui.nvim (MunifTanjim/nui.nvim) - UI component library (dependency)
--   Floating Help (nil70n/floating-help) - Floating help window popups
---
return {
  -- Catppuccin: Pastel theme
  -- Repo: https://github.com/catppuccin/nvim
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      compile = true,
      compile_path = vim.fn.stdpath 'cache' .. '/catppuccin',
      transparent_background = true,
      integrations = {
        cmp = true,
        dashboard = true,
        lsp_trouble = true,
        mason = true,
        mini = {
          enabled = true,
          indentscope_color = 'lavender',
        },
        neotree = true,
        noice = true,
        notify = true,
        telescope = { enabled = true },
        treesitter = true,
        which_key = true,
      },
    },
  },

  -- Noice: Replaces messages, cmdline, and popup menu
  -- Repo: https://github.com/folke/noice.nvim
  {
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
  },

  -- Floating Help: Just floats help windows
  {
    'nil70n/floating-help',
    opts = {
      border = 'rounded',
      ratio = 0.75,
    },
  },
}
