---
-- Colors: Theme and color rendering
--
-- Plugins:
--   Catppuccin (catppuccin/nvim) - Pastel color theme with plugin integrations
---
return {
  -- Catppuccin: Pastel theme
  -- Repo: https://github.com/catppuccin/nvim
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    opts = {
      transparent_background = true,
      integrations = {
        neotree = true,
        noice = true,
        neotest = true,
        mason = true,
        octo = true,
        lsp_trouble = true,
        which_key = true,
      },
    },
  },
}
