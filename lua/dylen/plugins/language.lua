-- language.lua
--
-- This file contains language-specific plugins and configurations.
-- Considering refactoring these into separate plugins.
return {
  { 'fatih/go.vim' }, -- Go LSP stuff; Must phase out
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
    end,
  },
}
