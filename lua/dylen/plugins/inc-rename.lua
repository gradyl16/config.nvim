-- inc-rename.lua
return {
  { -- Shows replacement with LSP rename
    'smjonas/inc-rename.nvim',
    config = function()
      require('inc_rename').setup {}
      vim.keymap.set('n', '<leader>rn', function()
        return ':IncRename ' .. vim.fn.expand '<cword>'
      end, { expr = true })
    end,
  },
}
