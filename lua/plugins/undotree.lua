---
-- Undotree: Visual tree-based undo history
--
-- Plugins:
--   Undotree (jiaoshijie/undotree) - Tree-style undo history browser
--
-- Keymaps: <leader>u toggle
---
return {
  -- Undotree: Tree-like undo history
  'jiaoshijie/undotree',
  dependencies = 'nvim-lua/plenary.nvim',
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    { '<leader>u', "<cmd>lua require('undotree').toggle()<cr>", desc = 'Undotree' },
  },
}
