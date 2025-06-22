-- persistence.lua
--
-- Save sessions.
-- Especially useful for me when I misconfigure something and
-- have to kill neovim before the OOM killer does.

return {
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    module = 'persistence',
    keys = {
      {
        '<leader>ps',
        function()
          require('persistence').load()
        end,
        mode = 'n',
        desc = 'Load the last session',
      },
      {
        '<leader>pS',
        function()
          require('persistence').select()
        end,
        mode = 'n',
        desc = 'Select a session to load',
      },
      {
        '<leader>pl',
        function()
          require('persistence').load { last = true }
        end,
        mode = 'n',
        desc = 'Load the last session',
      },
      {
        '<leader>pd',
        function()
          require('persistence').stop()
        end,
        mode = 'n',
        desc = 'Stop Persistence',
      },
    },
    config = function()
      require('persistence').setup {
        dir = vim.fn.expand(vim.fn.stdpath 'config' .. '/session/'),
        options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
      }
    end,
  },
}
