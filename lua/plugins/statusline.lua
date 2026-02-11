---
-- Statusline: Bottom status bar configuration
--
-- Plugins:
--   Lualine (nvim-lualine/lualine.nvim) - Configurable statusline with Catppuccin theme
---
return {
  -- Lualine: Configurable, fast status line
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- Config: https://github.com/nvim-lualine/lualine.nvim
  config = function()
    require('lualine').setup {
      options = {

        theme = 'catppuccin',
      },
    }
  end,
}
