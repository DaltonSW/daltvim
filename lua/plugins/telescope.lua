---
-- Telescope: Fuzzy finder for files, buffers, registers, and more
--
-- Plugins:
--   Telescope (nvim-telescope/telescope.nvim) - Extensible fuzzy finder
--
-- Keymaps: <leader>ff files, <leader>fb buffer, <leader>fr references, <leader>fs symbols
---
return {
  -- Telescope: Fuzzy-finder for many a thing
  -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  keys = {
    {
      '<leader>fb',
      function()
        require('telescope.builtin').current_buffer_fuzzy_find()
      end,
      desc = 'Find in Buffer',
    },
    {
      '<leader>ff',
      function()
        require('telescope.builtin').find_files()
      end,
      desc = 'Find Files',
    },
    {
      '<leader>fg',
      function()
        require('telescope.builtin').live_grep()
      end,
      desc = 'Find String in Files',
    },
    {
      '<leader>fr',
      function()
        require('telescope.builtin').lsp_references()
      end,
      desc = 'Find References',
    },
    {
      '<leader>fs',
      function()
        require('telescope.builtin').lsp_document_symbols()
      end,
      desc = 'Find Symbols',
    },
  },
}
