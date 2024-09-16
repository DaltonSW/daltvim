return {
  -- TODO Comments: Colorful keyword comment highlighting
  -- Repo: https://github.com/folke/todo-comments.nvim
  {
    -- Examples:
    -- TODO:
    -- NOTE:
    -- FIX:
    -- WARN:
    -- TEST:
    -- DOC:
    -- IDEA:

    -- TODO: Different colors?

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
        DOC = { icon = '󰈙 ', color = '#D1D1D1', alt = { 'DESC', 'PARAM', 'RETURN' } },
        IDEA = { icon = ' ', color = '#F1FA8C', alt = { 'TRY', 'PSEUDO' } },
      },
    },
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      -- LHS of toggle mappings in N and V mode
      toggler = {
        line = '<leader>cl',
        block = '<leader>cb',
      },

      -- LHS of operator-pending maps in N and V mode
      opleader = {
        line = 'cl',
        block = 'cb',
      },

      extra = {
        above = '<leader>cO',
        below = '<leader>co',
        eol = '<leader>ce',
      },
    },
  },
}
