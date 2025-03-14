return {
  {
    'benlubas/molten-nvim',
    version = '^2.0.0', -- use version <2.0.0 to avoid breaking changes
    dependencies = { '3rd/image.nvim' },
    build = ':UpdateRemotePlugins',
    keys = {
      -- Molten
      --
      -- Initialize the Jupyter kernel
      {
        '<localleader>mip',
        function()
          local venv = os.getenv 'VIRTUAL_ENV' or os.getenv 'CONDA_PREFIX'
          if venv ~= nil then
            -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
            venv = string.match(venv, '/.+/(.+)')
            vim.cmd(('MoltenInit %s'):format(venv))
          else
            vim.cmd 'MoltenInit python3'
          end
        end,
        mode = 'n',
        desc = 'Initialize Molten for python3',
        silent = true,
      },
      { '<localleader>miP', ':MoltenInit<CR>', silent = true, desc = 'Initialize the plugin' },

      -- Evaluation
      { '<localleader>me', ':MoltenEvaluateOperator<CR>', silent = true, mode = 'n', desc = 'run operator selection' },
      { '<localleader>mrl', ':MoltenEvaluateLine<CR>', silent = true, mode = 'n', desc = 'evaluate line' },
      { '<localleader>mrr', ':MoltenReevaluateCell<CR>', silent = true, mode = 'n', desc = 're-evaluate cell' },
      { '<localleader>mr', ':<C-u>MoltenEvaluateVisual<CR>gv', silent = true, mode = 'v', desc = 'evaluate visual selection' },
    },
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = 'image.nvim'
      vim.g.molten_output_win_max_height = 20
    end,
  },
}
