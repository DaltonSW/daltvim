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
      compile = true,
      compile_path = vim.fn.stdpath 'cache' .. '/catppuccin',
      transparent_background = true,
      integrations = {
        cmp = true,
        dashboard = true,
        lsp_trouble = true,
        mason = true,
        mini = true,
        neotree = true,
        noice = true,
        treesitter = true,
        which_key = true,
      },
    },
  },
}
