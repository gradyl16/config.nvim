-- return {
--   {
--     'kndndrj/nvim-dbee',
--     dependencies = {
--       'MunifTanjim/nui.nvim',
--     },
--     build = function()
--       -- Install tries to automatically detect the install method.
--       -- if it fails, try calling it with one of these parameters:
--       --    "", "wget", "bitsadmin", "go"
--       require('dbee').install()
--     end,
--     config = function()
--       require('dbee').setup(--[[optional config]])
--     end,
--   },
-- }
return {
  {
    "kndndrj/nvim-dbee",
    dependencies = { "MunifTanjim/nui.nvim" },
    build = function()
      require("dbee").install()
    end,
    config = function()
      local source = require "dbee.sources"
      require("dbee").setup {
        sources = {
          source.MemorySource:new({
            ---@diagnostic disable-next-line: missing-fields
            {
              type = "postgres",
              name = "CT Measurement",
              url = "postgresql://postgres:postgres@localhost:5432/ctdb",
            },
          }, "CT Measurement"),
        },
      }
      require "dylen.dbee"
    end,
  },
}
