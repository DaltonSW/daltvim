---
-- Editor: Core editing behavior, utilities, and keymap discovery
--
-- Plugins:
--   Vim Sleuth (tpope/vim-sleuth) - Auto-detects tabstop and shiftwidth from file contents
--   Conform (stevearc/conform.nvim) - Format-on-save with per-language formatters
--   nvim-ts-autotag (windwp/nvim-ts-autotag) - Auto-close and rename paired HTML/JSX tags
--   Render Markdown (MeanderingProgrammer/render-markdown.nvim) - Pretty inline markdown rendering
--   Which Key (folke/which-key.nvim) - Shows available keybindings as you type
--
-- Keymaps: <leader>? local buffer keymaps
---
return {
  {
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  },

  {
    -- Conform: Automatic formatting
    'stevearc/conform.nvim',
    lazy = false,
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'goimports' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        html = { 'prettier' },
      },
    },
  },

  -- TS Autotag: Automatically close and rename paired HTML tags
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = true,
  },

  -- RenderMarkdown: Pretty markdown rendering in-file
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-mini/mini.nvim',
    },
    ft = 'markdown',
    opts = {},
  },

  -- Which-Key: Show keymappings based on your current chords
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      preset = 'helix',
      spec = {
        { '<leader>f', group = 'Find' },
        { '<leader>g', group = 'Git' },
        { '<leader>s', group = 'Search' },
      },
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show { global = false }
        end,
        desc = 'Local Buffer Keymaps',
      },
    },
  },
}
