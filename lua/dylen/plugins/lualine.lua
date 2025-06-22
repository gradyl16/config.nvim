-- lualine.lua
--
-- A simple bufferline.

return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = 'dracula',
        refresh = {
          statusline = 1000,
        },
      },
    },
  },
}
