return {
  {
    -- Mini: Collection of standalone plugins under the "Mini" umbrella
    'nvim-mini/mini.nvim',
    version = false, -- Always use the rolling releases rather than only the stable versions

    config = function()
      -- Icons: Glyphs and icons for other plugins to take advantage of
      require('mini.icons').setup()
      -- Shim nvim-web-devicons so plugins that depend on it (e.g. neo-tree) use mini.icons instead
      MiniIcons.mock_nvim_web_devicons()

      -- IndentScope: Adds visual indent scope indicator
      require('mini.indentscope').setup()

      -- Jump: Better f/t jumping, repeat with ;
      require('mini.jump').setup()

      -- Jump2D: Allows for jumping anywhere in the view. Default keymap is <CR> (Enter/Return)
      require('mini.jump2d').setup()

      -- Move: Allows for easier moving of lines around
      require('mini.move').setup {
        mappings = {
          -- Move whole selection in visual mode
          left = '<C-M-h>',
          right = '<C-M-l>',
          up = '<C-M-k>',
          down = '<C-M-j>',

          -- Move current line in normal mode
          line_left = '<C-M-h>',
          line_right = '<C-M-l>',
          line_up = '<C-M-k>',
          line_down = '<C-M-j>',
        },
      }

      -- Pairs: Autopairing for parentheses, quotes, etc
      require('mini.pairs').setup()

      -- Statusline: Lightweight statusline (replaces lualine)
      require('mini.statusline').setup()

      -- Surround: Adds actions like "sa" for "surround add"
      require('mini.surround').setup()
    end,
  },

  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          keys = {
            { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
            { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
            { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
          },

          header = [[
      ⠀⠀⠀⠀⠀⠀⠀⠀⣰⣧⣼⣧⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣭⣭⣤⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣷⣤⣤⡄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣿⣮⣍⣉⣉⣀⣀⠀⠀⠀
⠀⠀⣠⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀
⣴⣿⣿⣿⣿⣿⣯⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀
⠉⣿⣿⣿⣿⣿⣿⣷⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀
⠀⣿⣿⣿⣿⣿⣿⡟⠸⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀
⠀⠘⢿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠉⠉⣿⣿⡏⠁⠀⠀⠀⠀⠀
⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀
]],
        },
        sections = {
          { section = 'header' },
          { title = 'Shortcuts', section = 'keys', indent = 2, padding = 1 },
          { title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
          { title = 'Projects', section = 'projects', indent = 2, padding = 1 },
          { section = 'startup' },
        },
      },

      image = { enabled = true },
      quickfile = { enabled = true },

      explorer = {
        replace_netrw = true,
      },

      picker = {
        ui_select = true,
        sources = {
          explorer = { layout = { preset = 'sidebar' } },
          files = { exclude = { '.git/', '.godot/', '*.tscn', '*.import', '*.uid' } },
          grep = { exclude = { '.git/', '.godot/', '*.tscn', '*.import', '*.uid' } },
        },
      },

      terminal = {},
    },

    keys = {
      -- Top pickers & explorer
      {
        '<leader><space>',
        function()
          Snacks.picker.smart()
        end,
        desc = 'Smart Find Files',
      },
      {
        '<leader>,',
        function()
          Snacks.picker.buffers()
        end,
        desc = 'Buffers',
      },
      {
        '<leader>/',
        function()
          Snacks.picker.grep()
        end,
        desc = 'Grep',
      },
      {
        '<leader>e',
        function()
          Snacks.explorer()
        end,
        desc = 'File Explorer',
      },
      {
        '<c-n>',
        function()
          local explorer = Snacks.picker.get({ source = 'explorer' })[1]
          if explorer then
            explorer:close()
          else
            Snacks.explorer()
          end
        end,
        desc = 'Toggle File Explorer',
      },

      -- find
      {
        '<leader>fc',
        function()
          Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
        end,
        desc = 'Find Config File',
      },
      {
        '<leader>ff',
        function()
          Snacks.picker.files()
        end,
        desc = 'Find Files',
      },
      {
        '<leader>fg',
        function()
          Snacks.picker.git_files()
        end,
        desc = 'Find Git Files',
      },
      {
        '<leader>fr',
        function()
          Snacks.picker.recent()
        end,
        desc = 'Recent Files',
      },

      -- git
      {
        '<leader>gb',
        function()
          Snacks.picker.git_branches()
        end,
        desc = 'Git Branches',
      },
      {
        '<leader>gl',
        function()
          Snacks.picker.git_log()
        end,
        desc = 'Git Log',
      },
      {
        '<leader>gs',
        function()
          Snacks.picker.git_status()
        end,
        desc = 'Git Status',
      },
      {
        '<leader>gS',
        function()
          Snacks.picker.git_stash()
        end,
        desc = 'Git Stash',
      },
      {
        '<leader>gd',
        function()
          Snacks.picker.git_diff()
        end,
        desc = 'Git Diff (Hunks)',
      },
      {
        '<leader>gg',
        function()
          Snacks.lazygit.open()
        end,
        desc = 'Lazygit',
      },

      -- gh (GitHub CLI)
      {
        '<leader>gi',
        function()
          Snacks.picker.gh_issue()
        end,
        desc = 'GitHub Issues (open)',
      },
      {
        '<leader>gI',
        function()
          Snacks.picker.gh_issue { state = 'all' }
        end,
        desc = 'GitHub Issues (all)',
      },
      {
        '<leader>gp',
        function()
          Snacks.picker.gh_pr()
        end,
        desc = 'GitHub Pull Requests (open)',
      },
      {
        '<leader>gP',
        function()
          Snacks.picker.gh_pr { state = 'all' }
        end,
        desc = 'GitHub Pull Requests (all)',
      },

      -- search
      {
        '<leader>sd',
        function()
          Snacks.picker.diagnostics()
        end,
        desc = 'Diagnostics',
      },
      {
        '<leader>sD',
        function()
          Snacks.picker.diagnostics_buffer()
        end,
        desc = 'Buffer Diagnostics',
      },
      {
        '<leader>sh',
        function()
          Snacks.picker.help()
        end,
        desc = 'Help Pages',
      },
      {
        '<leader>sk',
        function()
          Snacks.picker.keymaps()
        end,
        desc = 'Keymaps',
      },
      {
        '<leader>ss',
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = 'LSP Symbols',
      },
      {
        '<leader>sS',
        function()
          Snacks.picker.lsp_workspace_symbols()
        end,
        desc = 'LSP Workspace Symbols',
      },
      {
        '<leader>su',
        function()
          Snacks.picker.undo()
        end,
        desc = 'Undo History',
      },
      {
        '<leader>sw',
        function()
          Snacks.picker.grep_word()
        end,
        desc = 'Visual selection or word',
        mode = { 'n', 'x' },
      },

      -- todo comments
      {
        '<leader>st',
        function()
          Snacks.picker.grep { search = '\\b(TODO|FIX|FIXME|HACK|WARN|PERF|NOTE|TEST)\\b' }
        end,
        desc = 'Find TODOs',
      },

      -- terminal
      {
        '<c-/>',
        function()
          Snacks.terminal()
        end,
        desc = 'Toggle Terminal',
      },
      {
        '<c-_>',
        function()
          Snacks.terminal()
        end,
        desc = 'which_key_ignore',
      },
    },
  },
}
