return {
  -- Neotree: Tree visualizer. Mostly files, but git trees, diagnostics, etc.
  -- Default configs: https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    '3rd/image.nvim',
  },

  keys = {
    { '<leader>nf', '<cmd>Neotree reveal filesystem float<cr>', 'Neotree Files' },
    { '<leader>ng', '<cmd>Neotree reveal git_status float<cr>', 'Neotree Git' },
    { '<leader>nc', '<cmd>Neotree close<cr>', 'Neotree Close' },
  },

  opts = {
    width = 30,
    hijack_netrw_behavior = 'open_current',
  },
}
