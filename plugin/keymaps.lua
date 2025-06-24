--  See `:help set()`
local set = vim.keymap.set
local k = vim.keycode

-- [[ Why do I need these?! (╯°□°）╯︵ ┻━┻ ]]
--   Unmap s so it doesn't enter insert mode while i finish my mini surround motions/edits
set('n', 's', '<Nop>')
--   Unmap space so it doesn't do weird shit while I remember my keybinds (lets me see whick-key interface)
set('n', '<space>', '<Nop>')

-- [[ Navigation ]]
-- Session ending quality of life keybinds.
set('n', '<leader>Q', '<cmd>qall<CR>', { desc = '[Q]uit all buffers' })

-- Keybinds to make navigation with multilevel bodies of text that only
-- consume one line easier.
--   Use <hjkl> for all single level navigation.
set('n', 'j', function(...)
  local count = vim.v.count

  if count == 0 then
    return 'gj'
  else
    return 'j'
  end
end, { expr = true })

set('n', 'k', function(...)
  local count = vim.v.count

  if count == 0 then
    return 'gk'
  else
    return 'k'
  end
end, { expr = true })

-- Disable arrow keys in normal mode.
--   I don't disable L/R -- use to navigate between tabs.
-- set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
set('n', '<c-j>', '<c-w><c-j>')
set('n', '<c-k>', '<c-w><c-k>')
set('n', '<c-l>', '<c-w><c-l>')
set('n', '<c-h>', '<c-w><c-h>')

-- These mappings control the size of splits (height/width)
--   Normally these are not good mappings, but I have space cadet remappings
--   on all of my devices, so managing splits is quite easy this way.
set('n', '<c-right>', '<c-w>5>', { desc = 'Increase window width' })
set('n', '<c-left>', '<c-w>5<', { desc = 'Decrease window width' })
set('n', '<c-up>', '<c-w>+', { desc = 'Increase window height' })
set('n', '<c-down>', '<c-w>-', { desc = 'Decrease window height' })

-- Keybinds to make tab navigation easier.
--   Normally these are not good mappings, but I have space cadet remappings
--   on all of my devices, so navigating tabs is quite easy this way.
set('n', '<left>', 'gT')
set('n', '<right>', 'gt')

-- Toggle hlsearch if it's on, otherwise just do "enter"
set('n', '<Esc>', '<cmd>nohlsearch<CR>')
set('n', '<CR>', function()
  ---@diagnostic disable-next-line: undefined-field
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ''
  else
    return k '<CR>'
  end
end, { expr = true })

-- Diagnostics
set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Show diagnostic [E]rror messages' })
-- set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <c-\><c-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <c-\><c-n> to exit terminal mode
set('t', '<Esc><Esc>', '<c-\\><c-n>', { desc = 'Exit terminal mode' })

-- Swap lines easily by adding alt modifier to vertical navigation.
set('n', '<M-j>', function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! ]c]]
  else
    vim.cmd [[m .+1<CR>==]]
  end
end)

set('n', '<M-k>', function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! [c]]
  else
    vim.cmd [[m .-2<CR>==]]
  end
end)

-- [[ Code Keymaps ]]
--
-- Code execution quality of life
-- set('n', '<leader>x', '<cmd>.lua<CR>', { desc = 'Execute the current line' })
-- set('n', '<leader><leader>x', '<cmd>source %<CR>', { desc = 'Execute the current file' })

-- [[ Plugin Keymaps ]]
--
-- Markdown preview
set('n', '<leader>o', function()
  vim.fn.jobstart({ 'tatum', 'serve', '--open', vim.fn.expand '%' }, { noremap = true, silent = true })
end)

-- Persistence
--
-- load the session for the current directory
set('n', '<leader>qs', function()
  require('persistence').load()
end)

-- select a session to load
set('n', '<leader>qS', function()
  require('persistence').select()
end)

-- load the last session
set('n', '<leader>ql', function()
  require('persistence').load { last = true }
end)

-- stop Persistence => session won't be saved on exit
set('n', '<leader>qd', function()
  require('persistence').stop()
end)

-- CodeSnap
--
-- save the selected visual block
-- set({'v', 'x'}, '<leader>css', function() require('codesnap').save_snapshot() end)

-- Rust tools
--
-- Hover actions
-- vim.keymap.set('n', '<C-space>', require('rust-tools').hover_actions.hover_actions)
-- Code action groups
-- vim.keymap.set('n', '<Leader>a', require('rust-tools').code_action_group.code_action_group)
