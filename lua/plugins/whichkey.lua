---
-- Which Key: Keymap discovery and visualization
--
-- Plugins:
--   Which Key (folke/which-key.nvim) - Shows available keybindings as you type
--
-- Keymaps: <leader>? show local buffer keymaps
-- See also: config/whichkey-groups.lua for leader group registrations
---
return {
  -- Which-Key: Show keymappings based on your current chords
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
  },
  keys = {
    {
      '<leader>?', function() require('which-key').show { global = false } end, desc = 'Local Buffer Keymaps',
    },
  },
}
