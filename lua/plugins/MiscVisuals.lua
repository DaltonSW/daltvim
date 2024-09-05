return {
  -- Rainbow Delimiters: Colors matching pairs of brackets/parentheses/braces
  { 'HiPhish/rainbow-delimiters.nvim' },

  -- Nui: UI Component Library
  { 'MunifTanjim/nui.nvim', lazy = true },

  -- Indent Blankline: Keeps indentation lines even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    -- See `:help ibl`
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
        tab_char = '│',
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          'help',
          'alpha',
          'dashboard',
          'neo-tree',
          'Trouble',
          'trouble',
          'lazy',
          'mason',
          'notify',
          'toggleterm',
          'lazyterm',
        },
      },
    },
  },
}
