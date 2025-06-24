-- lazydev.lua
--
-- Configures Lua LSP for editing Neovim config.

return {
  {
    'folke/lazydev.nvim',
    opts = {
      ft = {
        'lua',
      },
      library = {
        'nvim-dap-ui',
        { path = 'snacks.nvim', words = { 'Snacks' } },
      },
    },
  },
}
