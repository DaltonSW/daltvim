---
-- Neo-tree: Tree-based browser for files, git status, and document symbols
--
-- Plugins:
--   Neo-tree (nvim-neo-tree/neo-tree.nvim) - Tree file/git/symbol browser
--
-- Keymaps: <leader>nc close, <leader>nf files, <leader>ng git, <leader>ns symbols
-- Defaults: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
---
return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },

  keys = {
    { '<leader>nc', '<cmd>Neotree close<cr>', desc = 'Neotree Close' },
    { '<leader>ng', '<cmd>Neotree reveal git_status<cr>', desc = 'Neotree Git Status' },
    { '<leader>nf', '<cmd>Neotree reveal filesystem<cr>', desc = 'Neotree Files' },
    { '<leader>ns', '<cmd>Neotree reveal document_symbols<cr>', desc = 'Neotree Symbols' },
  },

  opts = {
    close_if_last_window = true,

    popup_border_style = 'rounded',

    filesystem = {
      hijack_netrw_behavior = 'open_default',
    },

    window = {
      position = 'left',
    },

    default_component_configs = {
      modified = {
        symbol = '*',
        highlight = 'NeoTreeModified',
      },

      type = {
        enabled = true,
        required_width = 60,
      },

      git_status = {},
    },

    sources = {
      'filesystem',
      'git_status',
      'document_symbols',
    },

    nesting_rules = {},
  },
}
