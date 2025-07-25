-- conform.lua
--
-- NOTE: This plugin can be annoying if you have on autosave.
-- Since I have autosave enabled, I do not format on save as it is too disruptive.
return {
  { -- Provides autoformatting capabilities.
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      -- format_on_save = function(bufnr)
      --   -- Disable "format_on_save lsp_fallback" for languages that don't
      --   -- have a well standardized coding style. You can add additional
      --   -- languages here or re-enable it for the disabled ones.
      --   local disable_filetypes = { c = true, cpp = true }
      --   return {
      --     timeout_ms = 500,
      --     lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      --   }
      -- end,
      formatters_by_ft = {
        lua = { 'stylua' },
        markdown = { 'prettier' },
        vue = { 'prettier' },
        rust = { 'rustfmt' },
        html = { 'prettier' },
        latex = { 'tex-fmt' }

        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { 'prettierd', 'prettier' } },
      },
      linters_by_ft = {
        markdown = { 'markdownlint' },
      },
    },
  },
}
