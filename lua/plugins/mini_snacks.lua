---
-- Mini: Collection of small standalone plugins
--
-- Modules enabled:
--   mini.icons - Glyph/icon provider for other plugins
--   mini.jump - Enhanced f/t motions with ; repeat
--   mini.jump2d - Jump to any visible location (default: <CR>)
--   mini.move - Move lines/selections with <C-M-hjkl>
--   mini.pairs - Auto-pair brackets, quotes, parentheses
--   mini.statusline - Lightweight statusline
--   mini.surround - Add/delete/replace surrounding pairs (sa, sd, sr)
---
return {
  {
    -- Mini: Collection of standalone plugins under the "Mini" umbrella
    'nvim-mini/mini.nvim',
    version = false, -- Always use the rolling releases rather than only the stable versions

    config = function()
      -- Icons: Glyphs and icons for other plugins to take advantage of
      require('mini.icons').setup()

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
    {
      'folke/snacks.nvim',
      priority = 1000,
      lazy = false,
      opts = {
        bigfile = { enabled = true }, -- I don't work with bigfiles much but in case I ever do...?
        -- dashboard = { enabled = true }, -- TODO: Enable and configure
        image = { enabled = true },
        quickfile = { enabled = true },
      },
    },
  },
}
