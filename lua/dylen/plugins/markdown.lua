-- markdown.lua
--
-- A collection of small plugins that provide markdown support.
return {
  -- Useful tooling for navigating and editing markdown files.
  -- I have it disabled because I haven't been using it.
  --
  -- { 'tadmccorkle/markdown.nvim', ft = 'markdown', opts = {} },
  { -- A markdown previewer embedded directly into the working buffer.
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
