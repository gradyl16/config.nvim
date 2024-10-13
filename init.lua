-- Entry point for Dylen's Neovim configuration.
--   Just sets critical global options and bootstraps the lazy.nvim pkg
--   manager. See `:help lazy.nvim.txt`.

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
-- Add Lazy to the runtime path (allows us to "require" it)
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = ' ' -- See `:help mapleader`
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Setup lazy.nvim
require('lazy').setup({ import = 'dylen/plugins' }, {
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { 'dracula-soft' } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
})

-- vim: ts=2 sts=2 sw=2 et
