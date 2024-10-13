return {
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  { 'numToStr/Comment.nvim', opts = {} },
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
  -- NOTE: mini.nvim has a submodule that replaces most of vim.surround
  { 'tpope/vim-surround' },
  { 'tpope/vim-repeat' }, -- Extends `.` for plugin-related motions/commands
  { 'pocco81/auto-save.nvim' },
  { 'LunarVim/bigfile.nvim' }, -- Disable certain features for large files (perf)
}
