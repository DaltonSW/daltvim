---
-- Languages: Language-specific rendering and tooling
--
-- Plugins:
--   Render Markdown (MeanderingProgrammer/render-markdown.nvim) - Pretty inline markdown rendering
---
return {
  -- Markdown
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'mini-nvim/mini.nvim',
    },
    ft = '.md',
    opts = {},
  },
}
