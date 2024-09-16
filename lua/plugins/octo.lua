return {
  'pwntester/octo.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    default_remote = { 'origin' },

    -- mappings_disable_default = false,

    -- Used for highlight groups. All default
    -- colors = {
    --   red = '#fdb8c0',
    --   blue = '#58A6FF',
    --   grey = '#2A354C',
    --   white = '#ffffff',
    --   black = '#000000',
    --   green = '#acf2bd',
    --   purple = '#6f42c1',
    --   yellow = '#d3c846',
    --   dark_red = '#da3633',
    --   dark_blue = '#0366d6',
    --   dark_green = '#238636',
    --   dark_yellow = '#735c0f',
    -- },
  },

  keys = {
    { '<leader>oli', '<cmd>Octo issue list<cr>', desc = 'List Issues' },
    { '<leader>olr', '<cmd>Octo repo list<cr>', desc = 'List Issues' },

    { '<leader>oic', '<cmd>Octo issue create<cr>', desc = 'Issue Create' },

    { '<leader>oyr', '<cmd>Octo repo url<cr>', desc = 'Yank Repo URL' },
    { '<leader>oyp', '<cmd>Octo pr url<cr>', desc = 'Yank PR URL' },
    { '<leader>oyi', '<cmd>Octo issue url<cr>', desc = 'Yank Issue URL' },
  },
}
