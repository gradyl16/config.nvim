-- which-key.lua
--
-- Manages descriptions and mappings for when I inevitably forget them.

return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      preset = 'helix',
    },
    config = function(_, opts) -- This is the function that runs, AFTER loading
      require('which-key').setup(opts)

      -- Document existing key chains
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>h', group = 'Git [H]unk' },
        { '<leader>o', group = '[O]pen' },
        { '<leader>p', group = 'Session [P]ersistence' },
        { '<leader>r', group = '[R]efactor' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>v', group = '[V]env Select' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>x', group = 'E[x]amine Trouble' },
      }
      -- visual mode
      require('which-key').add {
        { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
      }
    end,
  },
}
