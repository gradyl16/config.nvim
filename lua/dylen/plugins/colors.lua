-- colors.lua
--
-- Define all color scheme plugins

return {
  {
    'binhtran432k/dracula.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
    init = function()
      vim.cmd.colorscheme 'dracula'
    end,
  },
  { 'folke/tokyonight.nvim' }, -- sick neon theme
}
