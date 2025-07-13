-- tresitter.lua
--
-- Treesitter support plugins. Highlight, edit, and navigate code.
return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    branch = 'main',
    config = function()
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
      --
      local languages = {
        'sh',
        'html',
        'css',
        'lua',
        'javascript',
        'typescript',
        'jsx',
        'tsx',
        'vue',
        'astro',
        'markdown',
        'markdown_inline',
        'latex',
        'python',
        'rust',
        'c',
      }

      require('nvim-treesitter').install(languages)

      -- Start Treesitter automatically
      vim.api.nvim_create_autocmd('FileType', {
        pattern = languages,
        callback = function()
          -- syntax highlighting, provided by Neovim
          vim.treesitter.start()
          -- folds, provided by Neovim
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
          -- indentation, provided by nvim-treesitter
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },

}
