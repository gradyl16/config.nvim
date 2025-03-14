-- terminal.lua
--
-- A collection of small plugins to improve terminal UX.
return {
  { -- enables toggleable terminal (rather than one you must open and close)
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 25,
        open_mapping = [[<m-1>]], -- use alt-1 to toggle terminal
        shading_factor = 0.5,
      }
    end,
  },
  {
    'ryanmsnyder/toggleterm-manager.nvim',
    dependencies = {
      'akinsho/nvim-toggleterm.lua',
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- only needed because it's a dependency of telescope
    },
    config = true,
  },
}
