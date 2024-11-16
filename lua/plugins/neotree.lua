return {
  -- Neotree: Tree visualizer. Mostly files, but git trees, diagnostics, etc.
  -- Repo: https://github.com/nvim-neo-tree/neo-tree.nvim
  -- Default configs: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    -- '3rd/image.nvim',
  },

  keys = {
    { '<leader>nf', '<cmd>Neotree reveal filesystem float<cr>', desc = 'Neotree Files' },
    { '<leader>ng', '<cmd>Neotree reveal git_status float<cr>', desc = 'Neotree Git' },
    { '<leader>nc', '<cmd>Neotree close<cr>', desc = 'Neotree Close' },
  },

  opts = {
    popup_border_style = 'rounded',

    filesystem = {
      hijack_netrw_behavior = 'open_default',
    },

    window = {
      position = 'float',
    },

    default_component_configs = {
      modified = {
        symbol = '[~] ',
        highlight = 'NeoTreeModified',
      },

      type = {
        enabled = true,
        required_width = 80,
      },

      git_status = {
        symbols = {},
      },
    },
  },
}
