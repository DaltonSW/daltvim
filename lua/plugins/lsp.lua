---
-- LSP: Language servers, completion, and tooling
--
-- Plugins:
--   Mason (mason-org/mason.nvim) - Package manager for LSP servers, formatters, linters
--   Mason-LSPConfig (mason-org/mason-lspconfig.nvim) - Auto-install and configure LSP servers
--   nvim-cmp (hrsh7th/nvim-cmp) - Completion engine
--   cmp-nvim-lsp (hrsh7th/cmp-nvim-lsp) - LSP source for nvim-cmp
--
-- Keymaps: gd definition, gD declaration, gr references, gI implementation,
--          gy type def, gs signature, F2 rename, F3 format
-- Uses Snacks.picker (folke/snacks.nvim) for definition/declaration/references/
-- implementation/type_definition pickers.
-- NOTE: Neovim 0.11 provides native LSP mappings for:
--   K (hover), grn (rename), grr (references), gra (code action),
--   gri (implementation), gO (document symbols)
-- gr/gI intentionally override the native grr/gri with picker-backed
-- equivalents (richer UI: fuzzy list + preview) instead of jumping/quickfix.
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

          vim.keymap.set('n', 'gd', function() Snacks.picker.lsp_definitions() end, kopts)
          vim.keymap.set('n', 'gD', function() Snacks.picker.lsp_declarations() end, kopts)
          vim.keymap.set('n', 'gr', function() Snacks.picker.lsp_references() end, kopts)
          vim.keymap.set('n', 'gI', function() Snacks.picker.lsp_implementations() end, kopts)
          vim.keymap.set('n', 'gy', function() Snacks.picker.lsp_type_definitions() end, kopts)
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
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
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
}
