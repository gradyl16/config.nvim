return {
  {
    'maxmx03/dracula.nvim',
    lazy = false,
    priority = 1000,
    styles = {
      types = {},
      functions = {},
      parameters = {},
      comments = {},
      strings = {},
      keywords = {},
      variables = {},
      constants = {},
    },
    transparent = false,
    on_colors = function(colors, color)
      ---@type dracula.palette
      return {
        -- override or create new colors
        mycolor = '#ffffff',
      }
    end,
    on_highlights = function(colors, color)
      ---@type dracula.highlights
      return {
        ---@type vim.api.keyset.highlight
        Normal = { fg = colors.mycolor },
      }
    end,
    plugins = {
      ['nvim-treesitter'] = true,
      ['rainbow-delimiters'] = true,
      ['nvim-lspconfig'] = true,
      ['nvim-navic'] = true,
      ['nvim-cmp'] = true,
      ['indent-blankline.nvim'] = true,
      ['neo-tree.nvim'] = true,
      ['nvim-tree.lua'] = true,
      ['which-key.nvim'] = true,
      ['dashboard-nvim'] = true,
      ['gitsigns.nvim'] = true,
      ['neogit'] = true,
      ['todo-comments.nvim'] = true,
      ['lazy.nvim'] = true,
      ['telescope.nvim'] = true,
      ['noice.nvim'] = true,
      ['hop.nvim'] = true,
      ['mini.statusline'] = true,
      ['mini.tabline'] = true,
      ['mini.starter'] = true,
      ['mini.cursorword'] = true,
      ['bufferline.nvim'] = true,
    },
    init = function()
      vim.cmd.colorscheme 'dracula-soft'
      vim.cmd.colorscheme 'dracula'
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        theme = vim.g.colors_name,
        refresh = {
          statusline = 1000,
        },
      },
    },
  },
}
-- return {
--   -- { -- You can easily change to a different colorscheme.
--   --   -- Change the name of the colorscheme plugin below, and then
--   --   -- change the command in the config to whatever the name of that colorscheme is.
--   --   --
--   --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--   --   'folke/tokyonight.nvim',
--   --   priority = 1000, -- Make sure to load this before all the other start plugins.
--   --   init = function()
--   --     -- Load the colorscheme here.
--   --     -- Like many other themes, this one has different styles, and you could load
--   --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--   --     vim.cmd.colorscheme 'tokyonight-night'
--   --
--   --     -- You can configure highlights by doing something like:
--   --     vim.cmd.hi 'Comment gui=none'
--   --   end,
--   -- },
--   { -- You can easily change to a different colorscheme.
--     -- Change the name of the colorscheme plugin below, and then
--     -- change the command in the config to whatever the name of that colorscheme is.
--     --
--     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--     'binhtran432k/dracula.nvim',
--     priority = 1000, -- Make sure to load this before all the other start plugins.
--     init = function()
--       -- Load the colorscheme here.
--       -- Like many other themes, this one has different styles, and you could load
--       -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--       vim.cmd.colorscheme 'dracula-soft'
--
--       -- You can configure highlights by doing something like:
--       vim.cmd.hi 'Comment gui=none'
--     end,
--   },
--   { 'folke/tokyonight.nvim' },
-- }
