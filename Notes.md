# Neovim Rewrite Notes

## Lazy Plugin Manager

- Leader and localleader need to be set before loading lazy
- Lazy will look for plugin specs in `~/.config/nvim/lua/plugins`. Each file should return a table with the plugins to install


