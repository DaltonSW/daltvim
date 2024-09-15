return {
  -- Which-Key: Show keymappings based on your current chords
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Local Buffer Keymaps',
    },
  },
}
