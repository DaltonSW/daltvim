return {
  -- Telescope: Fuzzy-finder for many a thing
  -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    require('telescope').setup {}
    local builtin = require 'telescope.builtin'

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find Git' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find Help' })
    vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = 'Find Registers' })

    vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, { desc = 'Find In Buffer' })
  end,
}
