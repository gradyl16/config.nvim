-- dbee.lua
return {
  { -- Database client
    'kndndrj/nvim-dbee',
    dependencies = { 'MunifTanjim/nui.nvim' },
    keys = {
      {
        '<space>od',
        function()
          require('dbee').open()
        end,
      },
      mode = 'n',
      desc = 'Open Dbee',
    },
    build = function()
      require('dbee').install()
    end,
    config = function()
      local source = require 'dbee.sources'
      require('dbee').setup {
        sources = {
          source.MemorySource:new({
            ---@diagnostic disable-next-line: missing-fields
            {
              type = 'postgres',
              name = 'CT Measurement (Mixed)',
              url = 'postgresql://postgres:postgres@localhost:5432/ctdb',
            },
            {
              type = 'postgres',
              name = 'CT Measurement (Sabre)',
              url = 'postgresql://postgres:postgres@localhost:5432/ctdb_sabre',
            },
          }, 'CT Measurement'),
        },
      }
      require 'dylen.dbee'
    end,
  },
}
