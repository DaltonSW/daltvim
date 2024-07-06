return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup {
      default_component_configs = {
        git_status = {
          symbols = {
            staged = '󰸞',
            unstaged = '󰜥',
          },
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_gitignored = false,
          hide_dotfiles = false,
          hide_by_name = {
            -- ???
          },
        },
      },
    }
    vim.keymap.set('n', '<leader>nn', '<cmd>Neotree focus<cr>', { desc = 'Focus [N]eotree [N]ow' })
    vim.keymap.set('n', '<leader>nc', '<cmd>Neotree close<cr>', { desc = '[N]eotree [C]lose' })
    vim.keymap.set('n', '<leader>nf', '<cmd>Neotree reveal<cr>', { desc = '[N]eotree Reveal [F]ile' })
  end,
}
