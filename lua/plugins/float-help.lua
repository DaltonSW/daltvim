---
-- Float Help: Opens :help in floating windows instead of splits
--
-- Plugins:
--   Floating Help (nil70n/floating-help) - Floating help window popups
---
return {
  -- Floating Help: Just floats help windows
  'nil70n/floating-help',
  cmd = 'FloatingHelp',
  opts = {
    border = 'rounded',
    ratio = 0.75,
  },
}
