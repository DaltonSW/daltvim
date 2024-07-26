return {
  -- TODO:
  -- NOTE:
  -- FIX:
  -- WARN:
  -- PERF:
  -- TEST:
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true,
    keywords = {
      TODO = { icon = '󰄲 ', color = '#A6FAFD' },
      NOTE = { icon = '󰎚 ', color = '#ABFF9B', alt = { 'INFO' } },
      FIX = { icon = '󰃤 ', color = '#FF7878', alt = { 'BUG', 'ISSUE' } },
      WARN = { icon = ' ', color = '#FFB86C', alt = { 'HEY', 'IDEA' } },
      PERF = { icon = '󰥔 ', color = '#D6B7F9', alt = { 'OPTIMIZE', 'SLOW', 'FAST' } },
      TEST = { icon = '󰙨 ', color = '#FFA1DC', alt = { 'SETUP', 'TEARDOWN' } },
    },
  },
}
