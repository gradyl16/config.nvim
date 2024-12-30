return {
  require('lazy').setup({
    {
      '3rd/image.nvim',
      opts = {
        version = '1.1.0',
      },
    },
  }, {
    rocks = {
      hererocks = true, -- recommended if you do not have global installation of Lua 5.1.
    },
  }),
}
