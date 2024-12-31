-- Neat plugin that helps manage a small amount of files with high efficiency.
-- See ThePrimeagen's YT channel for more vim stuff.

return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {}

      local wk = require 'which-key'

      wk.add {
        { '<leader>H', group = 'Harpoon' }, -- Harpoon group
        {
          '<leader>Ha',
          function()
            harpoon:list():add()
          end,
          desc = '[H]arpoon [a]dd current file',
        },
        {
          '<leader>Hd',
          function()
            harpoon:list():remove()
          end,
          desc = '[H]arpoon [d]elete current file',
        },

        -- Quick picks
        {
          '<C-t>',
          function()
            harpoon:list():select(1)
          end,
          desc = 'Harpoon toggle quick pick 1',
        },

        -- Toggle previous & next buffers stored within Harpoon list
        {
          '<C-p>',
          function()
            harpoon:list():prev()
          end,
          desc = 'Harpoon previous buffer',
        },
        {
          '<C-n>',
          function()
            harpoon:list():next()
          end,
          desc = 'Harpoon next buffer',
        },

        -- Telescope integration
        {
          '<C-e>',
          function()
            local conf = require('telescope.config').values
            local file_paths = {}
            for _, item in ipairs(harpoon:list().items) do
              table.insert(file_paths, item.value)
            end

            require('telescope.pickers')
              .new({}, {
                prompt_title = 'Harpoon',
                finder = require('telescope.finders').new_table { results = file_paths },
                previewer = conf.file_previewer {},
                sorter = conf.generic_sorter {},
              })
              :find()
          end,
          desc = 'Open Harpoon menu',
        },
      }
    end,
  },
}
