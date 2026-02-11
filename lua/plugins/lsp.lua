---
-- LSP: Language servers, completion, and tooling
--
-- Plugins:
--   Mason (mason-org/mason.nvim) - Package manager for LSP servers, formatters, linters
--   Mason-LSPConfig (mason-org/mason-lspconfig.nvim) - Auto-install and configure LSP servers
--   nvim-cmp (hrsh7th/nvim-cmp) - Completion engine
--   cmp-nvim-lsp (hrsh7th/cmp-nvim-lsp) - LSP source for nvim-cmp
--
-- See also: config/after.lua for LspAttach keymaps, CMP mapping setup, and lua_ls config
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
  },

  -- nvim-cmp: Completion engine
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
}
