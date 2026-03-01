---
-- LSP: Language servers, completion, and tooling
--
-- Plugins:
--   Mason (mason-org/mason.nvim) - Package manager for LSP servers, formatters, linters
--   Mason-LSPConfig (mason-org/mason-lspconfig.nvim) - Auto-install and configure LSP servers
--   nvim-cmp (hrsh7th/nvim-cmp) - Completion engine
--   cmp-nvim-lsp (hrsh7th/cmp-nvim-lsp) - LSP source for nvim-cmp
--
-- Keymaps: gd definition, gD declaration, go type def, gs signature, F2 rename, F3 format
-- Uses Telescope builtins for definition, declaration, and type_definition pickers.
-- NOTE: Neovim 0.11 provides native LSP mappings for:
--   K (hover), grn (rename), grr (references), gra (code action),
--   gri (implementation), gO (document symbols)
-- Only non-default bindings are set here.
---
return {
  -- Mason: Package manager for LSPs, DAP servers, linters, and formatters
  { 'mason-org/mason.nvim', opts = {} },

  -- Mason-LSPConfig: Handles auto-installing certain LSPs
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {
      ensure_installed = { 'lua_ls', 'gopls', 'ts_ls', 'pyright' },
    },
    config = function(_, opts)
      require('mason-lspconfig').setup(opts)

      -- lua_ls configuration via Neovim 0.11+ native API
      -- This merges with Mason-LSPConfig's setup; vim.lsp.config is additive.
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      vim.diagnostic.config {
        virtual_text = true,
      }

      -- LspAttach keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local kopts = { buffer = event.buf }

          vim.keymap.set('n', 'gd', function() require('telescope.builtin').lsp_definitions() end, kopts)
          vim.keymap.set('n', 'gD', function() require('telescope.builtin').lsp_declarations() end, kopts)
          vim.keymap.set('n', 'go', function() require('telescope.builtin').lsp_type_definitions() end, kopts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', kopts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', kopts)
          vim.keymap.set({ 'n', 'x' }, '<F3>', function()
            vim.lsp.buf.format { async = true }
          end, kopts)
        end,
      })
    end,
  },

  -- nvim-cmp: Completion engine
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require 'cmp'

      cmp.setup {
        sources = {
          { name = 'nvim_lsp' },
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        },
      }
    end,
  },
  { 'hrsh7th/cmp-nvim-lsp' },
}
