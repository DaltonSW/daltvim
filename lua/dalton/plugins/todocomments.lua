return {
  -- TODO:
  -- NOTE:
  -- BUG:
  -- WARN:
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
      FIX = { icon = '󰃤 ', color = 'error', alt = { 'BUG', 'ISSUE' } },
      WARN = { icon = ' ', color = 'warning', alt = { 'HEY' } },
      TODO = { icon = '󰄲 ', color = 'info' },
      NOTE = { icon = '󰎚 ', color = 'hint', alt = { 'INFO' } },
    },
  },
}
