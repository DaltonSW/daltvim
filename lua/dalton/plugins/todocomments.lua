return {
  -- TODO:
  -- NOTE:
  -- BUG:
  -- WARN:
  -- PERF:
  -- TEST:
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true,
    colors = {
      error = { 'DiagnosticError', 'ErrorMsg' },
      warning = { 'DiagnosticWarn' },
      info = { 'DiagnosticInfo' },
      hint = { 'Identifier' },
    },
    keywords = {
      FIX = { icon = '󰃤 ', color = '#FF5555', alt = { 'BUG', 'ISSUE' } },
      WARN = { icon = ' ', color = '#FFB86C', alt = { 'HEY', 'IDEA' } },
      TODO = { icon = '󰄲 ', color = '#8BE9FD' },
      NOTE = { icon = '󰎚 ', color = '#FF79C6', alt = { 'INFO' } },
      PERF = { icon = '󰥔 ', color = '#BD93F9', alt = { 'OPTIMIZE', 'SLOW', 'FAST' } },
      TEST = { icon = '󰙨 ', color = '', alt = { 'SETUP', 'TEARDOWN' } },
    },
  },
}
