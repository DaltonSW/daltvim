return {
  -- TODO Comments: Colorful keyword comment highlighting
  {
    -- Examples:
    -- TODO:
    -- NOTE:
    -- FIX:
    -- WARN:
    -- TEST:
    -- DOC:
    -- IDEA:

    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true,
      keywords = {
        TODO = { icon = '󰄲 ', color = '#A3FFE0' },
        NOTE = { icon = ' ', color = '#D9B3FF', alt = { 'INFO' } },
        BUG = { icon = '󰃤 ', color = '#FF7878', alt = { 'FIX', 'FIXME', 'ISSUE', 'SLOW' } },
        WARN = { icon = ' ', color = '#FFB86C', alt = { 'HEY', 'IDEA', 'PERF' } },
        TEST = { icon = '󰙨 ', color = '#FFA1DC', alt = { 'SETUP', 'TEARDOWN' } },
        DOC = { icon = '󰈙 ', color = '#D1D1D1', alt = { 'DESC', 'PARAM', 'RETURN' } }, -- TODO: Different color?
        IDEA = { icon = ' ', color = '#F1FA8C', alt = { 'TRY', 'PSEUDO' } },
      },
    },
    keys = {
      {
        ']t',
        function()
          require('todo-comments').jump_next()
        end,
        desc = 'Next Todo Comment',
      },
      {
        '[t',
        function()
          require('todo-comments').jump_prev()
        end,
        desc = 'Previous Todo Comment',
      },
      { '<leader>xt', '<cmd>Trouble todo toggle<cr>', desc = 'Todo (Trouble)' },
      { '<leader>xT', '<cmd>Trouble todo toggle filter = {tag = {TODO,BUG}}<cr>', desc = 'Todo/Bug (Trouble)' },
      { '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Todo' },
      { '<leader>sT', '<cmd>TodoTelescope keywords=TODO,BUG<cr>', desc = 'Todo/Bug' },
    },
  },

  -- Comment: "gc" to comment visual regions/lines
  'numToStr/Comment.nvim',
}
