-- dap.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui', -- Creates a beautiful debugger UI
    'nvim-neotest/nvim-nio', -- Required dependency for nvim-dap-ui
    'williamboman/mason.nvim', -- Installs the debug adapters for you
    'jay-babu/mason-nvim-dap.nvim',

    -- Add language-specific debugging plugins below
    'leoluz/nvim-dap-go',
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
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
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

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    require('dap-go').setup {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    }

    -- Install TS/JS specific config
    -- setup adapters
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'node',
        args = { vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' },
      },
    }

    -- custom adapter for running tasks before starting debug
    local custom_adapter = 'pwa-node-custom'
    dap.adapters[custom_adapter] = function(cb, config)
      if config.preLaunchTask then
        local async = require 'plenary.async'
        local notify = require('notify').async

        async.run(function()
          ---@diagnostic disable-next-line: missing-parameter
          notify('Running [' .. config.preLaunchTask .. ']').events.close()
        end, function()
          vim.fn.system(config.preLaunchTask)
          config.type = 'pwa-node'
          dap.run(config)
        end)
      end
    end

    -- language config
    for _, language in ipairs { 'typescript', 'javascript' } do
      dap.configurations[language] = {
        {
          name = 'Launch',
          type = 'pwa-node',
          request = 'launch',
          program = '${file}',
          rootPath = '${workspaceFolder}',
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**' },
        },
        {
          name = 'Frida: Attach to Inspector',
          type = 'pwa-node',
          request = 'attach',
          address = 'localhost',
          port = 9229,
          sourceMaps = true,
          protocol = 'inspector',
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          remoteRoot = '${workspaceFolder}',
          localRoot = '${workspaceFolder}',
          outFiles = '${workspaceFolder}/dist/**/*.js',
        },
        {
          name = 'Attach to node process',
          type = 'pwa-node',
          request = 'attach',
          rootPath = '${workspaceFolder}',
          processId = require('dap.utils').pick_process,
        },
        {
          name = 'Debug Main Process (Electron)',
          type = 'pwa-node',
          request = 'launch',
          program = '${workspaceFolder}/node_modules/.bin/electron',
          args = {
            '${workspaceFolder}/dist/index.js',
          },
          outFiles = {
            '${workspaceFolder}/dist/*.js',
          },
          resolveSourceMapLocations = {
            '${workspaceFolder}/dist/**/*.js',
            '${workspaceFolder}/dist/*.js',
          },
          rootPath = '${workspaceFolder}',
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**' },
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
        {
          name = 'Compile & Debug Main Process (Electron)',
          type = custom_adapter,
          request = 'launch',
          preLaunchTask = 'npm run build-ts',
          program = '${workspaceFolder}/node_modules/.bin/electron',
          args = {
            '${workspaceFolder}/dist/index.js',
          },
          outFiles = {
            '${workspaceFolder}/dist/*.js',
          },
          resolveSourceMapLocations = {
            '${workspaceFolder}/dist/**/*.js',
            '${workspaceFolder}/dist/*.js',
          },
          rootPath = '${workspaceFolder}',
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**' },
          protocol = 'inspector',
          console = 'integratedTerminal',
        },
      }
    end
  end,
}
