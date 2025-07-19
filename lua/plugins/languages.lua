return {
  -- Go
  -- {
  --   'ray-x/go.nvim',
  --   dependencies = { -- optional packages
  --     'ray-x/guihua.lua',
  --     'neovim/nvim-lspconfig',
  --     'nvim-treesitter/nvim-treesitter',
  --   },
  --   config = function()
  --     require('go').setup()
  --   end,
  --   event = { 'CmdlineEnter' },
  --   ft = { 'go', 'gomod' },
  --   build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  -- },
  {
    'crispgm/nvim-go',
    dependencies = { -- optional packages
      'nvim-lua/plenary.nvim',
      -- 'rcarriga/nvim-notify',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('go').setup({
        notify = true,
        auto_lint = false,
      })
      require('lspconfig').gopls.setup({})
    end,
  },

  -- TypeScript
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  -- C-Sharp / .NET
  {
    'iabdelkareem/csharp.nvim',
    dependencies = {
      'williamboman/mason.nvim', -- Required, automatically installs omnisharp
      'mfussenegger/nvim-dap',
      'Tastyep/structlog.nvim', -- Optional, but highly recommended for debugging
    },
    config = function()
      require('mason').setup() -- Mason setup must run before csharp, only if you want to use omnisharp
      require('csharp').setup()
    end,
  },

  -- Markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.nvim',
    },
    opts = {},
  },
}
