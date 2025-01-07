return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = true,
  keys = {
    { '<leader>ft', '<cmd>ToggleTerm direction=float<cr>', desc = 'Float Term' },
    { '<leader>fg', '<cmd>TermExec direction=float cmd="lazygit"<cr>', desc = 'Float Git' },
  },
}
