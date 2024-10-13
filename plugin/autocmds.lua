local command = vim.api.nvim_command
local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

command 'autocmd TermOpen * startinsert'
command 'autocmd TermOpen * setlocal nonumber norelativenumber'
command 'autocmd FileType oil setlocal nonumber norelativenumber'
