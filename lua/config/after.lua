-- Executes the callback function every time a
-- language server is attached to a buffer.
-- NOTE: Neovim 0.11 provides native LSP mappings for:
--   K (hover), grn (rename), grr (references), gra (code action),
--   gri (implementation), gO (document symbols)
-- Only non-default bindings are set here.
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  end,
})

-- Disable `unknown global 'vim'` error across all of the config
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" } }
    }
  }
})

vim.diagnostic.config {
  virtual_text = true,
}

require('notify').setup {
  background_colour = '#000000',
  merge_duplicates = true,
}

---
-- Autocompletion setup
---
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
  mapping = cmp.mapping.preset.insert {},
}

---
-- Treesitter
---
local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.vhs = {
  install_info = {
    url = 'https://github.com/charmbracelet/tree-sitter-vhs',
    files = { 'src/parser.c' },
    branch = 'main',
    generate_requires_npm = false,
    requires_generate_from_grammar = false,
  },
  filetype = 'tape',
}

-- Go HTML Template file autocmd
---
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile', 'BufWritePost' }, {
  pattern = '*.html',
  callback = function()
    local ft = vim.fn.expand '%:e'
    local pos = vim.fn.search('{{', 'n')
    if ft == 'html' and pos ~= 0 then
      vim.bo.filetype = 'gohtmltmpl'
    else
      vim.bo.filetype = 'html'
    end
  end,
})
