-- nvim-ts-autotag.lua
--
-- Automatically manage tags (e.g. in HTML/XML)

return {
  {
    'windwp/nvim-ts-autotag',
    opts = {
      -- Suppresses error about upgrading
      opts = {
        enable_close_on_slash = true, -- Auto close on trailing </
      },
    },
    -- Also override individual filetype configs, these take priority.
    -- Empty by default, useful if one of the "opts" global settings
    -- doesn't work well in a specific filetype
    -- per_filetype = {
    -- ['html'] = {
    --   enable_close = false,
    -- },
    -- },
  },
}
