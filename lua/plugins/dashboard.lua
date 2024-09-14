return {
  -- Dashboard: Startup screen
  'nvimdev/dashboard-nvim',
  lazy = false,
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
    local dateStr = string.rep('\n', 2) .. os.date ' %a, %b %d -- 󰥔 %I:%M:%S %p'
    local myHeader = string.rep('\n', 8) .. logo .. quote .. dateStr .. string.rep('\n', 2) .. string.rep('~', 20) .. string.rep('\n', 2)

    local opts = {
      theme = 'doom',
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = true,
      },
      config = {
        header = vim.split(myHeader, '\n'),
        -- TODO: Add a current date/time string below the header

	-- TODO: Neovim config

	-- TODO: Projects

	-- TODO: Previous session
        
        -- stylua: ignore
        center = {
          { key = "c", desc = "  Config",  action = "Telescope find_files cwd=~/.config/nvim" },
          { key = "f", desc = "  Files",  action = "Neotree reveal float" },
          { key = "l", desc = "󰒲  Lazy",  action = "Lazy" },
	  { key = "m", desc = "  Mason", action = "Mason" },
          -- { key = "p", desc = "?  Projects",  action = "Telescope find_files cwd=~/Projects" },
          { key = "q", desc = "  Quit",  action = function() vim.cmd("qa") end },
        },

        footer = function()
          local lazy = require 'lazy'

          local stats = lazy.stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local plugins = '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms'

          local foot = string.rep('\n', 1) .. string.rep('~', 20) .. string.rep('\n', 2) .. plugins
          return vim.split(foot, '\n')
        end,
      },
    }

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
