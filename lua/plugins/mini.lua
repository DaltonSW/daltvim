return {
  -- Mini: Collection of standalone plugins under the "Mini" umbrella
  'echasnovski/mini.nvim',
  version = false, -- Always use the rolling releases rather than only the stable versions

  config = function()
    -- Animate: Add some visual smoothness to common navigations
    require('mini.animate').setup()

    -- Icons: Glyphs and icons for other plugins to take advantage of
    require('mini.icons').setup()

    -- Pairs: Autopairing for parentheses, quotes, etc
    require('mini.pairs').setup()

    -- Trailspace
    -- NOTE: If enabled, disable highlighting and enable hotkeys for trimming
    -- require('mini.trailspace').setup()
  end,

  -- -- Comment
  -- -- Cursorword
  -- -- Jump
  -- -- Jump2D
  -- -- Move
  -- -- Operators
  -- -- Pairs: Autopairing for parentheses and quote objects
}
