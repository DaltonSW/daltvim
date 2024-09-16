return {
  -- Mini: Collection of standalone plugins under the "Mini" umbrella
  'echasnovski/mini.nvim',
  version = false, -- Always use the rolling releases rather than only the stable versions

  config = function()
    -- Animate: Add some visual smoothness to common navigations
    require('mini.animate').setup()

    -- Files
    -- require ('mini.files').setup()

    -- Icons: Glyphs and icons for other plugins to take advantage of
    require('mini.icons').setup()

    -- Jump
    -- require ('mini.jump').setup()

    -- Jump2D
    -- require ('mini.jump2d').setup()

    -- Move
    -- require ('mini.move').setup()

    -- Operators
    -- require ('mini.operators').setup()

    -- Pairs: Autopairing for parentheses, quotes, etc
    require('mini.pairs').setup()

    -- Surround(?)
    -- require ('mini.surround').setup()

    -- Trailspace
    -- NOTE: If enabled, disable highlighting and enable hotkeys for trimming
    -- require('mini.trailspace').setup()
  end,
}
