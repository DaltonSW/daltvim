---
-- Mini: Collection of small standalone plugins
--
-- Modules enabled:
--   mini.hipatterns - Highlight patterns (TODO keywords, hex colors)
--   mini.icons - Glyph/icon provider for other plugins
--   mini.jump - Enhanced f/t motions with ; repeat
--   mini.jump2d - Jump to any visible location (default: <CR>)
--   mini.move - Move lines/selections with <C-M-hjkl>
--   mini.pairs - Auto-pair brackets, quotes, parentheses
--   mini.statusline - Lightweight statusline
--   mini.surround - Add/delete/replace surrounding pairs (sa, sd, sr)
---
return {
  -- Mini: Collection of standalone plugins under the "Mini" umbrella
  'nvim-mini/mini.nvim',
  version = false, -- Always use the rolling releases rather than only the stable versions

  config = function()
    -- Hipatterns: Highlight TODO-style keywords and inline hex colors
    require('mini.hipatterns').setup {
      highlighters = {
        todo = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        task = { pattern = '%f[%w]()TASK()%f[%W]', group = 'MiniHipatternsTodo' },
        note = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        info = { pattern = '%f[%w]()INFO()%f[%W]', group = 'MiniHipatternsNote' },
        bug = { pattern = '%f[%w]()BUG()%f[%W]', group = 'MiniHipatternsFixme' },
        fix = { pattern = '%f[%w]()FIX()%f[%W]', group = 'MiniHipatternsFixme' },
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        issue = { pattern = '%f[%w]()ISSUE()%f[%W]', group = 'MiniHipatternsFixme' },
        warn = { pattern = '%f[%w]()WARN()%f[%W]', group = 'MiniHipatternsHack' },
        hack = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        perf = { pattern = '%f[%w]()PERF()%f[%W]', group = 'MiniHipatternsHack' },
        test = { pattern = '%f[%w]()TEST()%f[%W]', group = 'MiniHipatternsNote' },
        doc = { pattern = '%f[%w]()DOC()%f[%W]', group = 'MiniHipatternsNote' },
        repo = { pattern = '%f[%w]()REPO()%f[%W]', group = 'MiniHipatternsHack' },

        -- Here's a hex color #00CC00 and maybe even another here #B4D455
        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
      },
    }

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
}
