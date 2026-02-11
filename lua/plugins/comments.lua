---
-- Comments: Keyword highlighting in code comments
--
-- Plugins:
--   TODO Comments (folke/todo-comments.nvim) - Highlights TODO, NOTE, BUG, WARN, etc.
---
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

    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = true,
      keywords = {
        TODO = { icon = '󰄲 ', color = '#06d6a0', alt = { 'TASK' } },
        NOTE = { icon = ' ', color = '#D9B3FF', alt = { 'INFO' } },
        BUG = { icon = '󰃤 ', color = '#FF5A5F', alt = { 'FIX', 'FIXME', 'ISSUE', 'SLOW' } },
        WARN = { icon = ' ', color = '#FFB86C', alt = { 'HEY', 'HACK', 'PERF' } },
        TEST = { icon = '󰙨 ', color = '#FFA1DC', alt = { 'SETUP', 'TEARDOWN' } },
        DOC = { icon = '󰈙 ', color = '#D1D1D1', alt = { 'DESC', 'PARAM', 'RETURN' } },
        REPO = { icon = '󰳏', color = '#FFE66D', alt = { 'Repo' } },
      },
    },
  },

  -- NOTE: Neovim 0.10+ has native gc/gcc commenting.
  -- Comment.nvim was removed in favor of built-in support.
}
