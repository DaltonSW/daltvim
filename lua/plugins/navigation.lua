---
-- Navigation: File finding, browsing, and diagnostic lists
--
-- Plugins:
--   Telescope (nvim-telescope/telescope.nvim) - Extensible fuzzy finder
--   Neo-tree (nvim-neo-tree/neo-tree.nvim) - Tree file/git/symbol browser
--   Trouble (folke/trouble.nvim) - Enhanced list viewer for diagnostics and more
--
-- Keymaps:
--   Telescope: <leader>ff files, <leader>fb buffer, <leader>fg grep,
--              <leader>fr references, <leader>fs symbols
--   Neo-tree:  <leader>nc close, <leader>nf files, <leader>ng git, <leader>ns symbols
--   Trouble:   <leader>xx diagnostics, <leader>xl location list, <leader>xq quickfix
---
return {
  -- Telescope: Fuzzy-finder for many a thing
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },

    keys = {
      {
        '<leader>fb',
        function()
          require('telescope.builtin').current_buffer_fuzzy_find()
        end,
        desc = 'Find in Buffer',
      },
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Find Files',
      },
      {
        '<leader>fg',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Find String in Files',
      },
      {
        '<leader>fr',
        function()
          require('telescope.builtin').lsp_references()
        end,
        desc = 'Find References',
      },
      {
        '<leader>fs',
        function()
          require('telescope.builtin').lsp_document_symbols()
        end,
        desc = 'Find Symbols',
      },
    },
  },

  -- Neo-tree: Tree-based browser for files, git status, and document symbols
  -- https://github.com/nvim-neo-tree/neo-tree.nvim
  -- Defaults: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
  {
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
      { '<leader>nf', '<cmd>Neotree reveal filesystem<cr>', desc = 'Neotree Files' },
      { '<leader>ng', '<cmd>Neotree reveal git_status<cr>', desc = 'Neotree Git Status' },
      { '<leader>ns', '<cmd>Neotree reveal document_symbols<cr>', desc = 'Neotree Symbols' },
    },

    opts = {
      hide_root_node = true,
      retain_hidden_root_indent = true,
      close_if_last_window = true,

      popup_border_style = 'rounded',

      filesystem = {
        show_hidden_count = false,
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

      nesting_rules = {
        ['uid'] = {
          pattern = '(.+)',
          files = { '%1.uid' },
        },
        ['import'] = {
          pattern = '(.+)',
          files = { '%1.import' },
        },
      },
    },
  },

  -- Trouble: Pretty diagnostic, quickfix, and location list viewer
  -- https://github.com/folke/trouble.nvim
  {
    'folke/trouble.nvim',
    opts = {},
    cmd = 'Trouble',
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
  },
}
