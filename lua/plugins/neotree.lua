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
    { '<leader>nf', '<cmd>Neotree reveal filesystem<cr>', desc = 'Neotree Files' },
    { '<leader>ns', '<cmd>Neotree reveal document_symbols<cr>', desc = 'Neotree Symbols' },
    { '<leader>nc', '<cmd>Neotree close<cr>', desc = 'Neotree Close' },
  },

  opts = {
    popup_border_style = 'rounded',

    filesystem = {
      hijack_netrw_behavior = 'open_default',
    },

    window = {
      position = 'left',
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
        symbols = {

        },
      },
    },

    sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols"
    },
  },
}
