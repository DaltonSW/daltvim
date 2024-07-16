return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    local theme = require 'alpha.themes.theta'
    theme.header.val = {
      [[      ⠀⠀⠀⠀⠀⠀⠀⠀⣰⣧⣼⣧⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣭⣭⣤⣄⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣷⣤⣤⡄]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣿⣮⣍⣉⣉⣀⣀⠀⠀⠀]],
      [[⠀⠀⣠⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀]],
      [[⣴⣿⣿⣿⣿⣿⣯⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀]],
      [[⠉⣿⣿⣿⣿⣿⣿⣷⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀]],
      [[⠀⣿⣿⣿⣿⣿⣿⡟⠸⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀]],
      [[⠀⠘⢿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠉⠉⣿⣿⡏⠁⠀⠀⠀⠀⠀]],
      [[⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀]],
      [[]],
      [[Make Cool Shit & Have Fun]],
    }
    theme.buttons.val = {
      dashboard.button('c', ' .config', ':Neotree ~/.config<CR>'),
      dashboard.button('l', ' Lazy', ':Lazy<CR>'),
      dashboard.button('n', ' nvim config', ':Neotree ~/.config/nvim<CR>'),
      dashboard.button('p', ' Projects', ':Neotree ~/Projects<CR>'),
      dashboard.button('q', '󰅗 Quit NVIM', ':qa<CR>'),
      dashboard.button('SPC `', '', ''),
      dashboard.button('SPC ~', '~Bookmarked Projects', ''),
      dashboard.button('SPC 1', 'YouTerm', ':Neotree ~/Projects/Terminality/YouTerm<CR>'),
      dashboard.button('SPC 2', 'Termina', ':Neotree ~/Projects/Termina<CR>'),
    }
    -- theme.footer.val = 'Make Cool Shit and Have Fun'

    alpha.setup(theme.config)
  end,
}
