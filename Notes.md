# Neovim Rewrite Notes

## Lazy Plugin Manager

- Leader and localleader need to be set before loading lazy
- Lazy will look for plugin specs in `~/.config/nvim/lua/plugins`. Each file should return a table with the plugins to install
- Either put stuff in `nvim/lua/plugins.lua` or any combination of files in `nvim/lua/plugins/*.lua`

### Lazy Plugin Spec Info

https://lazy.folke.io/spec

**Always** use `opts` instead of `config`, if possible. `config` is almost never needed.

#### Do

`{ "folke/todo-comments.nvim", opts = {} },`

#### Don't

```lua
{
  "folke/todo-comments.nvim",
  config = function()
    require("todo-comments").setup({})
  end,
},
```


