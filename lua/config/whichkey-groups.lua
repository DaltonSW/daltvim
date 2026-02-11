-- Which-key leader group registrations
-- Defines the group labels shown when pressing <leader> + prefix
local wk = require 'which-key'
wk.add {
  { '<leader>f', group = 'Find' },
  { '<leader>n', group = 'Neotree' },
  { '<leader>s', group = 'Search' },
  { '<leader>u', group = 'Utilities' },
  { '<leader>x', group = 'Trouble' },
}
