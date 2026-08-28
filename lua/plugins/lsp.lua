---
-- LSP: Language servers, completion, and tooling
--
-- Plugins:
--   Mason (mason-org/mason.nvim) - Package manager for LSP servers, formatters, linters
--   Mason-LSPConfig (mason-org/mason-lspconfig.nvim) - Auto-install and configure LSP servers
--   LazyDev (folke/lazydev.nvim) - Neovim runtime + plugin types for lua_ls
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

  -- LazyDev: Feeds lua_ls the Neovim runtime types and, on demand, the source of
  -- plugins referenced in this config. Each `library` entry is loaded only when a
  -- matching `words` pattern appears in the buffer, so startup stays cheap.
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
        -- Plugins that install themselves as globals rather than modules
        { path = 'snacks.nvim',        words = { 'Snacks' } },
        { path = 'mini.nvim',          words = { 'Mini%w+' } },
      },
    },
  },

  -- Mason-LSPConfig: Handles auto-installing certain LSPs
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    opts = {
      ensure_installed = { 'lua_ls', 'gopls', 'ts_ls', 'pyright', 'clangd', 'svelte', 'eslint' },
    },
    config = function(_, opts)
      require('mason-lspconfig').setup(opts)

      -- NOTE: lua_ls needs no `diagnostics.globals` list here. LazyDev (above)
      -- supplies the Neovim runtime and plugin types, which is what actually
      -- defines `vim`, `Snacks`, `Mini*`, etc.

      vim.diagnostic.config {
        virtual_text = true,
        severity_sort = true,
        float = { border = 'rounded', source = true },
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

          -- Code actions (native `gra` still works for the full menu)
          local function ckey(lhs, fn, desc)
            vim.keymap.set('n', lhs, fn, vim.tbl_extend('force', kopts, { desc = desc }))
          end
          ckey('<leader>ca', vim.lsp.buf.code_action, 'Code action')
          ckey('<leader>co', function()
            vim.lsp.buf.code_action { context = { only = { 'source.organizeImports' } }, apply = true }
          end, 'Organize imports')
          ckey('<leader>cf', function()
            -- Covers tsserver's fixable diagnostics and the ESLint LSP
            -- (source.fixAll.eslint). ESLint also registers :LspEslintFixAll.
            vim.lsp.buf.code_action { context = { only = { 'source.fixAll' } }, apply = true }
          end, 'Fix all (LSP / ESLint)')
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
          -- group_index = 0 lets LazyDev results replace lua_ls's weaker ones
          { name = 'lazydev', group_index = 0 },
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
