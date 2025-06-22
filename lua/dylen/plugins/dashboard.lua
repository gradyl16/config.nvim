-- dashboard.lua
--
-- Displays a navigation dashboard when neovim is run without args.
-- Not really the most handy as I mostly use persistence to navigate
-- recent files.

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {}
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
