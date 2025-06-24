-- harpoon.lua
--
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

      -- Harpoon group prefix (usually for which-key or similar)
      -- If you use which-key you can register this group separately

      -- Add current file
      vim.keymap.set('n', '<leader>Ha', function()
        harpoon:list():add()
      end, { desc = '[H]arpoon [a]dd current file' })

      -- Delete current file
      vim.keymap.set('n', '<leader>Hd', function()
        harpoon:list():remove()
      end, { desc = '[H]arpoon [d]elete current file' })

      -- Quick pick 1
      vim.keymap.set('n', '<C-t>', function()
        harpoon:list():select(1)
      end, { desc = 'Harpoon toggle quick pick 1' })

      -- Previous buffer in Harpoon list
      vim.keymap.set('n', '<C-p>', function()
        harpoon:list():prev()
      end, { desc = 'Harpoon previous buffer' })

      -- Next buffer in Harpoon list
      vim.keymap.set('n', '<C-n>', function()
        harpoon:list():next()
      end, { desc = 'Harpoon next buffer' })

      -- Custom picker with Snacks
      vim.keymap.set('n', '<C-i>', function()
        local Snacks = require 'snacks' -- assuming Snacks is a module
        Snacks.picker {
          finder = function()
            local file_paths = {}
            for _, item in ipairs(harpoon:list().items) do
              table.insert(file_paths, {
                text = item.value,
                file = item.value,
              })
            end
            return file_paths
          end,
          win = {
            input = {
              keys = {
                ['dd'] = { 'harpoon_delete', mode = { 'n', 'x' } },
              },
            },
            list = {
              keys = {
                ['dd'] = { 'harpoon_delete', mode = { 'n', 'x' } },
              },
            },
          },
          actions = {
            harpoon_delete = function(picker, item)
              local to_remove = item or picker:selected()
              table.remove(harpoon:list().items, to_remove.idx)
              picker:find {
                refresh = true,
              }
            end,
          },
        }
      end, { desc = 'Harpoon custom picker with Snacks' })
    end,
  },
}
