return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    local wk = require 'which-key'
    wk.setup()

    wk.register {
      ['<leader>'] = {
        a = { '<cmd>Alpha<cr>', '[A]lpha' },
        m = { '<cmd>Mason<cr>', '[M]ason' },
        p = { '<cmd>Lazy<cr>', '[P]lugins' },
        u = { "<cmd>lua require('undotree').toggle()<cr>'", '[U]ndo Tree' },
      },
    }

    wk.register {
      ['<leader>'] = {
        d = {
          name = '[D]iagnostics',
          -- e = { vim.diagnostic.open_float, "Show [E]rrors"},
          -- n = { vim.diagnostic.get_next, "Show [E]rrors"},

          -- Diagnostic keymaps
          -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
          -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
          -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
          -- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
        },
      },
    }
    -- Document existing key chains
    wk.register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]iagnostics', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]SP Actions', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
    }
    -- visual mode
    wk.register({
      ['<leader>h'] = { 'Git [H]unk' },
    }, { mode = 'v' })
  end,
}
