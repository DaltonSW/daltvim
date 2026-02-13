---
-- Which Key: Keymap discovery and visualization
--
-- Plugins:
--   Which Key (folke/which-key.nvim) - Shows available keybindings as you type
--
-- Keymaps: <leader>? show local buffer keymaps
---
return {
  -- Which-Key: Show keymappings based on your current chords
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
    spec = {
      { '<leader>f', group = 'Find' },
      { '<leader>n', group = 'Neotree' },
      { '<leader>s', group = 'Search' },
      { '<leader>u', group = 'Utilities' },
      { '<leader>x', group = 'Trouble' },
    },
  },
  keys = {
    {
      '<leader>?', function() require('which-key').show { global = false } end, desc = 'Local Buffer Keymaps',
    },
  },
}
