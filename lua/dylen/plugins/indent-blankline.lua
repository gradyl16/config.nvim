-- indent-blankline.lua
--
-- Add indentation guides even on blank lines.

return {
{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      exclude = {
        filetypes = {
          'help',
          'dashboard',
          'neogitstatus',
          'Trouble',
        },
        buftypes = {
          'nofile',
          'terminal',
        },
      },
    },
  },
}
