-- Empty plugin
return {
  -- Spec Source
  'username/example-plugin.nvim',

  -- Spec Loading
  dependencies = {},
  enabled = false, -- Whether the plugin is enabled. Can use cond if you want to evaluate conditionally
  priority = 50, -- Only useful for plugins where lazy=false

  -- Spec Setup
  opts = {}, -- Table that will be merged with default spec
  init = function() end, -- Executed during every startup
  build = function() end, -- Executed during install OR update

  -- Spec Lazy Loading
  lazy = true, -- Whether or not to lazy load (only load when it's needed)
  event = 'BufEnter', -- What event to load on
  cmd = 'ExampleCmd', -- What command to load on
  ft = { 'md', 'py' }, -- What filetypes to load during
  keys = {}, -- What keys to load during. Also just sets the keys for the plugin
}
