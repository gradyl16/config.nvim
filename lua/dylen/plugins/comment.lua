-- comment.lua
--
-- Plugins that manage comments.

return {
  -- Extra keybindings for working with comments
  { 'numToStr/Comment.nvim', opts = {} },
  -- Special syntax highlighting for special comment types (e.g. TODO, WARNING, NOTE, etc)
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
