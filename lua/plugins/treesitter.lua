---
-- Treesitter: Incremental parsing for syntax highlighting, indentation, and text objects
--      Treesitter does NOT handle any LSP things and strictly goes off of text contents
--      Kinda like a super-duper regex matcher. LSPs can also send highlighting information
--      that might be more accurate than Treesitter, so neovim will combine the most specific
--
--      NOTE: This uses the `main` branch rewrite (required for Neovim 0.12+). The old
--      `master` branch crashes on nvim 0.12 (query_predicates.lua range() error), which
--      breaks markdown code-block rendering. `main` has no config-module API: highlight
--      and indent are enabled via a FileType autocmd, and parsers are installed imperatively.
--      `main` also does not support lazy-loading, so this must load at startup.
--
-- Plugins:
--   Treesitter (nvim-treesitter/nvim-treesitter) - Code parsing and highlighting engine
--   Treesitter Textobjects (nvim-treesitter/nvim-treesitter-textobjects) - Function/class motions
--
-- Keymaps: ]f/[f functions, ]c/[c classes, ]a/[a parameters (start); uppercase = end
---
local ensure_installed = {
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
  'vhs',
  'vim',
  'vimdoc',
  'xml',
  'yaml',
}

return {
  -- Treesitter: Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false, -- the `main` branch does not support lazy-loading
    build = ':TSUpdate',

    config = function()
      require('nvim-treesitter').setup()

      -- VHS custom parser for .tape files (not in the registry).
      -- Registered both directly (for the install() below) and on `User TSUpdate`
      -- (so `:TSUpdate` rebuilds it). The repo ships a pre-generated src/parser.c.
      local function register_vhs()
        require('nvim-treesitter.parsers').vhs = {
          install_info = {
            url = 'https://github.com/charmbracelet/tree-sitter-vhs',
            branch = 'main',
          },
        }
      end
      register_vhs()
      vim.treesitter.language.register('vhs', { 'tape' })
      vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate', callback = register_vhs })

      -- install() is a no-op for parsers that are already installed
      require('nvim-treesitter').install(ensure_installed)

      -- Enable highlighting + indentation per-buffer when a parser is available
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local ft = vim.bo[args.buf].filetype
          local lang = vim.treesitter.language.get_lang(ft) or ft
          if vim.tbl_contains(require('nvim-treesitter').get_installed(), lang) then
            vim.treesitter.start(args.buf, lang)
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })

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

  -- Treesitter Textobjects: function/class/parameter motions (]f [f etc.)
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = 'main',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = 'VeryLazy',
    config = function()
      require('nvim-treesitter-textobjects').setup {
        move = { set_jumps = true },
      }

      local move = require 'nvim-treesitter-textobjects.move'
      local modes = { 'n', 'x', 'o' }
      -- lhs -> { move fn, query }
      local maps = {
        [']f'] = { move.goto_next_start, '@function.outer' },
        [']c'] = { move.goto_next_start, '@class.outer' },
        [']a'] = { move.goto_next_start, '@parameter.inner' },
        [']F'] = { move.goto_next_end, '@function.outer' },
        [']C'] = { move.goto_next_end, '@class.outer' },
        [']A'] = { move.goto_next_end, '@parameter.inner' },
        ['[f'] = { move.goto_previous_start, '@function.outer' },
        ['[c'] = { move.goto_previous_start, '@class.outer' },
        ['[a'] = { move.goto_previous_start, '@parameter.inner' },
        ['[F'] = { move.goto_previous_end, '@function.outer' },
        ['[C'] = { move.goto_previous_end, '@class.outer' },
        ['[A'] = { move.goto_previous_end, '@parameter.inner' },
      }
      for lhs, spec in pairs(maps) do
        vim.keymap.set(modes, lhs, function()
          spec[1](spec[2], 'textobjects')
        end, { desc = 'TS ' .. spec[2] })
      end
    end,
  },
}
