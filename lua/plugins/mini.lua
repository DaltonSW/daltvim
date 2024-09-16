return {
  -- Mini: Collection of standalone plugins under the "Mini" umbrella
  'echasnovski/mini.nvim',
  version = false, -- Always use the rolling releases rather than only the stable versions

  config = function()
    -- Animate: Add some visual smoothness to common navigations
    require('mini.animate').setup { cursor = { enable = false } }

    -- Files: File display in a series of floating windows
    -- require ('mini.files').setup()

    -- Icons: Glyphs and icons for other plugins to take advantage of
    require('mini.icons').setup()

    -- Jump: Better f/t jumping, repeat with ;
    require('mini.jump').setup()

    -- Jump2D: Allows for jumping anywhere in the view
    -- require ('mini.jump2d').setup()

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

    -- Operators
    -- require ('mini.operators').setup()

    -- Pairs: Autopairing for parentheses, quotes, etc
    require('mini.pairs').setup()

    -- Surround
    require('mini.surround').setup()

    -- Trailspace
    -- NOTE: If enabled, disable highlighting and enable hotkeys for trimming
    -- require('mini.trailspace').setup()
  end,
}
