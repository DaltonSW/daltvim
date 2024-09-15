return {
  -- Dashboard: Startup screen
  -- Repo: https://github.com/nvimdev/dashboard-nvim
  'nvimdev/dashboard-nvim',
  lazy = false,
  keys = { { '<leader>d', '<cmd>Dashboard<cr>', desc = 'Open Dashboard' } },
  opts = function()
    local logo = [[
      ⠀⠀⠀⠀⠀⠀⠀⠀⣰⣧⣼⣧⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣭⣭⣤⣄⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣷⣤⣤⡄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣼⣿⣮⣍⣉⣉⣀⣀⠀⠀⠀
⠀⠀⣠⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀
⣴⣿⣿⣿⣿⣿⣯⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀
⠉⣿⣿⣿⣿⣿⣿⣷⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀
⠀⣿⣿⣿⣿⣿⣿⡟⠸⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀
⠀⠘⢿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠉⠉⣿⣿⡏⠁⠀⠀⠀⠀⠀
⠀⠀⢸⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀
]]

    local quote = string.rep('\n', 2) .. 'Make Cool Shit & Have Fun'
    local myHeader = string.rep('\n', 8) .. logo .. quote .. string.rep('\n', 2) .. '┏' .. string.rep('━', 50) .. '┓' .. string.rep('\n', 3)

    local opts = {
      theme = 'doom',
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = true,
      },
      config = {
        header = vim.split(myHeader, '\n'),

        -- stylua: ignore
        center = {
          { icon = " ", key = "c", desc = " Config",  action = "Telescope find_files cwd=~/.config/nvim" },
          { icon = " ", key = "f", desc = " Filetree",  action = "Neotree reveal filesystem float" },
          { icon = "󰒲 ", key = "l", desc = " Lazy",  action = "Lazy" },
	  { icon = " ", key = "m", desc = " Mason", action = "Mason" },
          -- TODO: { icon = "? ", key = "p", desc = " Projects",  action = "Telescope find_files cwd=~/Projects" },
          { icon = " ", key = "q", desc = " Quit",  action = function() vim.cmd("qa") end },
        },

        footer = function()
          local lazy = require 'lazy'

          local stats = lazy.stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local plugins = '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'

          local dateStr = string.rep('\n', 2) .. os.date " (%a) %b %d, '%y -- 󰥔 %I:%M %p"
          local foot = string.rep('\n', 2) .. '┗' .. string.rep('━', 50) .. '┛' .. dateStr .. string.rep('\n', 2) .. plugins
          return vim.split(foot, '\n')
        end,
      },
    }

    -- Set spacing between descriptions and keys
    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(' ', 30 - #button.desc)
      button.key_format = '  %s'
    end

    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function()
        vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#89dceb', bg = 'NONE', italic = false })
        vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#fab387', bg = 'NONE', italic = false })

        vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#f38ba8', bg = 'NONE', italic = false })
        vim.api.nvim_set_hl(0, 'DashboardIcon', { fg = '#f38ba8', bg = 'NONE', italic = false })
        vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#f5e0dc', bg = 'NONE', italic = false })
      end,
    })

    -- Open dashboard after closing lazy
    if vim.o.filetype == 'lazy' then
      vim.api.nvim_create_autocmd('WinClosed', {
        pattern = tostring(vim.api.nvim_get_current_win()),
        once = true,
        callback = function()
          vim.schedule(function()
            vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
          end)
        end,
      })
    end

    return opts
  end,
}
