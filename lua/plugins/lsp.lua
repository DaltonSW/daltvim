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
  { 'nvim-cmp' },
}
