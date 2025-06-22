-- barbecue.lua
--
-- Adds buffer header that displays object hierarchy

return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    theme = 'dracula'
  },
}
