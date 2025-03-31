return {
  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  },
  {
    -- Searchbox: Lets you do %s functionality with better UX
    'VonHeikemen/searchbox.nvim',
    dependencies = {
      { 'MunifTanjim/nui.nvim' },
    },
    opts = {},
  },
}
