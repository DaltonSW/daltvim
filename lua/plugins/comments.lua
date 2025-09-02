return {
  -- TODO Comments: Colorful keyword comment highlighting
  -- REPO: https://github.com/folke/todo-comments.nvim
  {
    -- Examples:
    -- TODO:
    -- NOTE:
    -- FIX:
    -- WARN:
    -- TEST:
    -- DOC:

    -- TODO: Different colors?

    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true,
      keywords = {
        TODO = { icon = '󰄲 ', color = '#06d6a0', alt = { 'TASK' } },
        NOTE = { icon = ' ', color = '#D9B3FF', alt = { 'INFO' } },
        BUG = { icon = '󰃤 ', color = '#FF5A5F', alt = { 'FIX', 'FIXME', 'ISSUE', 'SLOW' } },
        WARN = { icon = ' ', color = '#FFB86C', alt = { 'HEY', 'HACK', 'PERF' } },
        TEST = { icon = '󰙨 ', color = '#FFA1DC', alt = { 'SETUP', 'TEARDOWN' } },
        DOC = { icon = '󰈙 ', color = '#D1D1D1', alt = { 'DESC', 'PARAM', 'RETURN' } },
        REPO = { icon = '󰳏', color = '#FFE66D', alt = { 'Repo' } },
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
