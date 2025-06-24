-- dap.lua
--
-- Configure interactive debugging capabilities

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui', -- Creates a beautiful debugger UI
    'nvim-neotest/nvim-nio', -- Required dependency for nvim-dap-ui
    'williamboman/mason.nvim', -- Installs the debug adapters for you
    'jay-babu/mason-nvim-dap.nvim',

    -- Add language-specific debugging plugins below
    -- 'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        'python',
      },
    }

    -- Basic debugging keymaps
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<F4>', dap.terminate, { desc = 'Debug: Terminate' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- language config
    -- There is probably an existing debug adapter that works.
    --
    -- dap.configurations.python = {
    --   {
    --     type = 'python',
    --     request = 'launch',
    --     name = 'Launch with CWD-relative args',
    --     program = '${file}',
    --     args = function()
    --       local cwd = vim.fn.getcwd()
    --       local input = vim.fn.input 'Args (relative to CWD): '
    --       local parts = vim.fn.split(input, ' ', true)
    --
    --       -- Prepend CWD to any relative path arguments
    --       local full_args = {}
    --       for _, part in ipairs(parts) do
    --         if vim.fn.filereadable(part) == 1 or vim.fn.isdirectory(part) == 1 then
    --           table.insert(full_args, cwd .. '/' .. part)
    --         else
    --           table.insert(full_args, part)
    --         end
    --       end
    --
    --       return full_args
    --     end,
    --     console = 'integratedTerminal',
    --   },
    -- }
  end,
}
