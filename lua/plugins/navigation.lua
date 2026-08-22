---
-- Navigation: TODO-style keyword highlighting
--
-- Plugins:
--   Todo Comments (folke/todo-comments.nvim) - Highlight and list TODO-style keywords
--
-- File finding, grep, buffers, explorer, git, and LSP goto pickers now live in
-- mini_snacks.lua (folke/snacks.nvim) - see that file's `keys` table.
---
return {
  -- Todo Comments: Highlight and search TODO-style keywords with icons
  -- https://github.com/folke/todo-comments.nvim
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VimEnter',
    opts = {
      keywords = {
        TODO = { icon = '󰄲', color = 'info', alt = { 'TASK' } },
        NOTE = { icon = '󰎞', color = 'hint', alt = { 'INFO', 'REPO', 'DOC' } },
        TEST = { icon = '󰙨 ', color = 'test' },
        FIX = { icon = '󱌣', color = 'error', alt = { 'FIXME', 'BUG', 'ISSUE', 'ERROR' } },
        WARN = { icon = '󰈸', color = 'warning', alt = { 'HACK' } },
        WHAT = { icon = '', color = 'warning', alt = { 'WHAT' } },
        REGION = { icon = '󰍎', color = 'test' }
      },
    },
  },
}
