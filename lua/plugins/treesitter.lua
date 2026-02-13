---
-- Treesitter: Incremental parsing for syntax highlighting, indentation, and text objects
--
-- Plugins:
--   Treesitter (nvim-treesitter/nvim-treesitter) - Code parsing and highlighting engine
--
-- Keymaps: <C-Space> increment selection, <BS> decrement, ]f/[f functions, ]c/[c classes
---
return {
  -- Treesitter: Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    branch = 'master',
    build = ':TSUpdate',
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    cmd = { 'TSUpdateSync', 'TSUpdate', 'TSInstall' },

    init = function(plugin)
      require('lazy.core.loader').add_to_rtp(plugin)
      require 'nvim-treesitter.query_predicates'
    end,

    keys = {
      { '<c-space>', desc = 'Increment Selection' },
      { '<bs>', desc = 'Decrement Selection', mode = 'x' },
    },
    opts_extend = { 'ensure_installed' },

    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'diff',
        'gdscript',
        'gdshader',
        'go',
        'godot_resource',
        'html',
        'json',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'python',
        'regex',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'xml',
        'yaml',
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },

      textobjects = {
        move = {
          enable = true,
          goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
          goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
          goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer', ['[a'] = '@parameter.inner' },
          goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer', ['[A'] = '@parameter.inner' },
        },
      },
    },

    config = function(_, opts)
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- VHS custom parser for .tape files
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

      -- Go HTML Template file detection
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
    end,
  },
}
