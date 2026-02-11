---
-- Telescope: Fuzzy finder for files, buffers, registers, and more
--
-- Plugins:
--   Telescope (nvim-telescope/telescope.nvim) - Extensible fuzzy finder
--
-- Keymaps: <leader>ff files, <leader>fb buffer, <leader>fr registers, <leader>fs spell
---
return {
  -- Telescope: Fuzzy-finder for many a thing
  -- https://github.com/nvim-telescope/telescope.nvim
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },

  config = function()
    require('telescope').setup {
      pickers = {
        spell_suggest = {
          layout_strategy = "cursor",
          layout_config = {
              width = 0.33,
              height = 15,
          }
        }
      }
    }
    local builtin = require 'telescope.builtin'
    local wk = require 'which-key'

    wk.add({
      {
        mode = { "n" },

          { "<leader>ff", builtin.find_files, desc = "Find Files in CWD" },
          { "<leader>fb", builtin.current_buffer_fuzzy_find, desc = "Find in Buffer" },
          { "<leader>fr", builtin.registers, desc = "Find in Registers" },
          { "<leader>fs", builtin.spell_suggest, desc = "Find Spell Suggestions" }
      }
    })
  end,
}
