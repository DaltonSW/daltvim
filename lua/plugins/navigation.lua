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
        TODO = { icon = '󰄲', color = 'info', alt = { 'TASK', 'todo' } },
        NOTE = { icon = '󰎞', color = 'hint', alt = { 'INFO', 'REPO', 'DOC', 'note' } },
        TEST = { icon = '󰙨 ', color = 'test' },
        FIX = { icon = '󱌣', color = 'error', alt = { 'FIXME', 'BUG', 'ISSUE', 'ERROR' } },
        WARN = { icon = '󰈸', color = 'warning', alt = { 'HACK', 'warning' } },
        WHAT = { icon = '', color = 'warning', alt = { 'WHAT' } },
        REGION = { icon = '󰍎', color = 'test' },

        -- Doxygen tags (@note/@warning/@todo reuse the groups above)
        brief = { icon = '󰈙', color = 'hint' },
        param = { icon = '󰘦', color = 'default' },
        ['return'] = { icon = '󰌑', color = 'default', alt = { 'retval' } },
        throws = { icon = '󰢃', color = 'error', alt = { 'exception' } },
        see = { icon = '󰗀', color = 'hint', alt = { 'sa' } },
        deprecated = { icon = '󰗼', color = 'warning' },
        author = { icon = '󰆆', color = 'default' },
        since = { icon = '󰃭', color = 'default' },
      },
      highlight = {
        -- Outer group = highlighted span (includes `:`/`@`), inner group = keyword lookup
        pattern = { [[.*<((KEYWORDS)\s*:)]], [[.*(\@(KEYWORDS))\s*]] },
        keyword = 'bg', -- 'wide' also bolds/colors the trailing space
      },
    },
  },
}
