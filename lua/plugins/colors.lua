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

  -- Highlight Colors: Adds colors to hex codes, HSL codes, CSS variables, etc
  -- Repo: https://github.com/brenoprata10/nvim-highlight-colors
  {
    'brenoprata10/nvim-highlight-colors',
    lazy = false,
    cmd = 'HighlightColors',
    config = function()
      require('nvim-highlight-colors').setup {} -- Not sure why, but this explicit setup is required
    end,
  },
}
