---
-- Navigation: File finding, browsing, and diagnostic lists
--
-- Plugins:
--   Telescope (nvim-telescope/telescope.nvim) - Extensible fuzzy finder
--   Neo-tree (nvim-neo-tree/neo-tree.nvim) - Tree file/git/symbol browser
--   Trouble (folke/trouble.nvim) - Enhanced list viewer for diagnostics and more
--   Todo Comments (folke/todo-comments.nvim) - Highlight and list TODO-style keywords
--
-- Keymaps:
--   Telescope: <leader>ff files, <leader>fb buffer, <leader>fg grep,
--              <leader>fr references, <leader>fs symbols
--   Neo-tree:  <leader>nc close, <leader>nf files, <leader>ng git, <leader>ns symbols
--   Trouble:   <leader>xx diagnostics, <leader>xl location list, <leader>xq quickfix,
--              <leader>xt TODOs
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
    cmd = 'Telescope',

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
      {
        '<leader>ft',
        '<cmd>TodoTelescope<cr>',
        desc = 'Find TODOs',
      },
    },

    defaults = {
      file_ignore_patterns = {
        '.git/',
        '.godot/',
        '*.tscn',
        '*.import',
        '*.uid',
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

  -- Todo Comments: Highlight and search TODO-style keywords with icons
  -- https://github.com/folke/todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VimEnter',
    opts = {
      keywords = {
        TODO = { icon = ' ', color = 'info' },
        TASK = { icon = ' ', color = 'info' },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        TEST = { icon = '⏲ ', color = 'test' },
        DOC = { icon = ' ', color = 'hint' },
        FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'ISSUE' } },
        WARN = { icon = ' ', color = 'warning' },
        HACK = { icon = ' ', color = 'warning', alt = { 'REPO' } },
        PERF = { icon = ' ', color = 'warning' },
      },
    },
  },
}
